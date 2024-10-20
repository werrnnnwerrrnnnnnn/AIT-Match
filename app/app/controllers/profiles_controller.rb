class ProfilesController < ApplicationController
  # Only allow signed-in users to access profile actions
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  before_action :check_profile_completion, only: [:index, :show, :edit, :update]

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

  def show
    @profile = Profile.find_by(id: params[:id])
    @interests = @profile.interests
    if @profile.nil?
      redirect_to profiles_path, alert: "Profile not found."
    else
      @user = @profile.user # Get the user associated with the profile
    end
  
    # Extract the Google Drive file ID if the URL is from Google Drive
    if @profile.profile_picture_url.present? && @profile.profile_picture_url.include?("drive.google.com")
      @drive_image_id = @profile.profile_picture_url.split('/d/')[1].split('/')[0]
    else
      @drive_image_id = nil
    end
  end

  def index
    # Fetch all profiles, excluding the current user's own profile
    @profiles = Profile.where.not(user: current_user)
  
    # Initialize @filtered_profiles as all profiles, then apply filters
    @filtered_profiles = @profiles
  
    # Apply filtering only if the current user has set preferences
    if current_user.preference.present?
      preference = current_user.preference
      puts "Applying filters based on preferences: #{preference.inspect}" # Debugging log
  
      # Filter by age range
      if preference.preferred_min_age.present? && preference.preferred_max_age.present?
        @filtered_profiles = @filtered_profiles.where("age >= ? AND age <= ?", preference.preferred_min_age, preference.preferred_max_age)
        puts "Filtered by age: #{@filtered_profiles.size} profiles remaining" # Debugging log
      end
  
      # Filter by gender preferences
      if preference.preferred_genders.any?
        @filtered_profiles = @filtered_profiles.joins(:gender).where(genders: { id: preference.preferred_gender_ids })
        puts "Filtered by gender: #{@filtered_profiles.size} profiles remaining" # Debugging log
      end
  
      # Filter by interest preferences
      if preference.preferred_interests.any?
        @filtered_profiles = @filtered_profiles.joins(:interests).where(interests: { id: preference.preferred_interest_ids })
        puts "Filtered by interests: #{@filtered_profiles.size} profiles remaining" # Debugging log
      end
  
      # Filter by relationship preferences
      if preference.preferred_relationships.any?
        @filtered_profiles = @filtered_profiles.joins(:relationships).where(relationships: { id: preference.preferred_relationship_ids })
        puts "Filtered by relationships: #{@filtered_profiles.size} profiles remaining" # Debugging log
      end
  
      # Filter by MBTI preferences
      if preference.preferred_mbti.any?
        @filtered_profiles = @filtered_profiles.joins(:mbti).where(mbtis: { id: preference.preferred_mbti_ids })
        puts "Filtered by MBTI: #{@filtered_profiles.size} profiles remaining" # Debugging log
      end
  
      # Filter by school preferences
      if preference.preferred_schools.any?
        @filtered_profiles = @filtered_profiles.joins(:school).where(schools: { id: preference.preferred_school_ids })
        puts "Filtered by schools: #{@filtered_profiles.size} profiles remaining" # Debugging log
      end
  
      # Filter by program preferences
      if preference.preferred_programs.any?
        @filtered_profiles = @filtered_profiles.joins(:program).where(programs: { id: preference.preferred_program_ids })
        puts "Filtered by programs: #{@filtered_profiles.size} profiles remaining" # Debugging log
      end
    else
      # If no preferences are set, show random profiles
      @filtered_profiles = @filtered_profiles.order("RANDOM()").limit(10)
      puts "Showing random profiles: #{@filtered_profiles.size}" # Debugging log
    end
  end

  def destroy
    if @profile.destroy
      redirect_to root_path, notice: 'Profile was successfully deleted.'
    else
      redirect_to profile_path(@profile), alert: 'Something went wrong. Unable to delete profile.'
    end
  end

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
    # Filter by age range
    if preference.preferred_min_age.present? && preference.preferred_max_age.present?
      @profiles = @profiles.where("age >= ? AND age <= ?", preference.preferred_min_age, preference.preferred_max_age)
    end

    # Filter by gender preferences
    if preference.preferred_genders.any?
      @profiles = @profiles.joins(:gender).where(genders: { id: preference.preferred_gender_ids })
    end

    # Filter by interest preferences
    if preference.preferred_interests.any?
      @profiles = @profiles.joins(:interests).where(interests: { id: preference.preferred_interest_ids })
    end

    # Filter by relationship preferences
    if preference.preferred_relationships.any?
      @profiles = @profiles.joins(:relationships).where(relationships: { id: preference.preferred_relationship_ids })
    end

    # Filter by MBTI preferences
    if preference.preferred_mbti.any?
      @profiles = @profiles.joins(:mbti).where(mbtis: { id: preference.preferred_mbti_ids })
    end

    # Filter by school preferences
    if preference.preferred_schools.any?
      @profiles = @profiles.joins(:school).where(schools: { id: preference.preferred_school_ids })
    end

    # Filter by program preferences
    if preference.preferred_programs.any?
      @profiles = @profiles.joins(:program).where(programs: { id: preference.preferred_program_ids })
    end
  end
end