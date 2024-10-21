class ProfilesController < ApplicationController
  # Only allow signed-in users to access profile actions
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  before_action :check_profile_completion, only: [:index, :show, :edit, :update]
  skip_before_action :set_profile, only: [:index, :search, :show_all] # Skipping profile setting for search and show_all

  def index
    # Fetch all profiles, excluding the current user's own profile
    @profiles = Profile.where.not(user: current_user)
  
    # Initialize @filtered_profiles as all profiles
    @filtered_profiles = @profiles

    # Check if filtering should be disabled (via disable_filters parameter)
    if params[:disable_filters].present?
      # Skip applying filters
      @filtering_disabled = true
    else
      # Apply filters only if the user has set preferences and no sorting is applied
      if current_user.preference.present?
        apply_filters(current_user.preference)
        @filtering = true
      end
    end

    # Sorting logic: A-Z, Z-A, or random
    case params[:order]
    when 'asc'
      @filtered_profiles = @filtered_profiles.order(user_name: :asc)
      @sorted_az = true
    when 'desc'
      @filtered_profiles = @filtered_profiles.order(user_name: :desc)
      @sorted_za = true
    when 'random'
      @filtered_profiles = @filtered_profiles.order('RANDOM()')
      @showing_random = true
    end

    # Check if the user is searching by username
    if params[:username].present?
      # If a search term is present, filter profiles by username
      @filtered_profiles = @profiles.where('user_name ILIKE ?', "%#{params[:username]}%")
      @searching = true
    end

    # If no profiles match the search or filters
    if @filtered_profiles.empty?
      @no_profiles_found = true
    else
      @no_profiles_found = false
    end

    # Show all profiles only when the "Show All Profiles" button is clicked
    @showing_all = params[:show_all].present?
  end

  def search
    # Redirect to index with the username parameter to perform the search
    redirect_to profiles_path(username: params[:username])
  end

  def show_all
    # Redirect to index with a parameter to show all profiles
    redirect_to profiles_path(show_all: true)
  end

  def show
    @profile = Profile.find_by(id: params[:id])
    if @profile.nil?
      redirect_to profiles_path, alert: "Profile not found."
    else
      @interests = @profile.interests
      @user = @profile.user

      # Extract Google Drive file ID if the URL is from Google Drive
      if @profile.profile_picture_url.present? && @profile.profile_picture_url.include?("drive.google.com")
        @drive_image_id = @profile.profile_picture_url.split('/d/')[1].split('/')[0]
      else
        @drive_image_id = nil
      end
    end
  end

  def new
    if current_user.profile.present?
      flash[:alert] = 'You already have a profile. Please edit your existing profile.'
      redirect_to profile_path(current_user.profile)
    else
      @profile = Profile.new
    end
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @profile.destroy
      redirect_to root_path, notice: 'Profile was successfully deleted.'
    else
      redirect_to profile_path(@profile), alert: 'Something went wrong. Unable to delete profile.'
    end
  end

  #-----------------------------Private------------------------------------#
  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def authorize_user!
    unless @profile.user == current_user
      redirect_to profiles_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :user_name, 
                                    :mbti_id, :gender_id, :degree_id, 
                                    :school_id, :program_id, :educational_background, 
                                    :profile_picture_url, :preferred_min_age, :preferred_max_age,
                                    :birthday, interest_ids: [], relationship_ids: [])
  end

  def check_profile_completion
    if current_user.profile.nil?
      flash[:alert] = "Please complete your profile before accessing this page."
      redirect_to new_profile_path
    end
  end

  def apply_filters(preference)
    # Calculate age range from birthday
    if preference.preferred_min_age.present? && preference.preferred_max_age.present?
      today = Date.today
      # Calculate the minimum and maximum birthday dates based on the age range
      min_birthdate = today.years_ago(preference.preferred_max_age)
      max_birthdate = today.years_ago(preference.preferred_min_age)
  
      # Use birthday range instead of age for filtering
      @filtered_profiles = @filtered_profiles.where("birthday >= ? AND birthday <= ?", min_birthdate, max_birthdate)
    end
  
    # Filter by gender preferences
    if preference.preferred_genders.any?
      @filtered_profiles = @filtered_profiles.joins(:gender).where(genders: { id: preference.preferred_gender_ids })
    end
  
    # Filter by interest preferences
    if preference.preferred_interests.any?
      @filtered_profiles = @filtered_profiles.joins(:interests).where(interests: { id: preference.preferred_interest_ids })
    end
  
    # Filter by relationship preferences
    if preference.preferred_relationships.any?
      @filtered_profiles = @filtered_profiles.joins(:relationships).where(relationships: { id: preference.preferred_relationship_ids })
    end
  
    # Filter by MBTI preferences
    if preference.preferred_mbti.any?
      @filtered_profiles = @filtered_profiles.joins(:mbti).where(mbtis: { id: preference.preferred_mbti_ids })
    end
  
    # Filter by school preferences
    if preference.preferred_schools.any?
      @filtered_profiles = @filtered_profiles.joins(:school).where(schools: { id: preference.preferred_school_ids })
    end
  
    # Filter by program preferences
    if preference.preferred_programs.any?
      @filtered_profiles = @filtered_profiles.joins(:program).where(programs: { id: preference.preferred_program_ids })
    end
  end
end