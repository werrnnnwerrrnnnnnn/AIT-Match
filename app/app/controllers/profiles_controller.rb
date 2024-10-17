class ProfilesController < ApplicationController
  # Only allow signed-in users to access profile actions
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

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
  
    puts "Profile Params: #{profile_params.inspect}" # Check the parameters being passed
  
    if @profile.save
      puts "Profile saved successfully."
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      puts "Failed to save profile: #{@profile.errors.full_messages.join(", ")}"
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

  # def show
  #   puts "Params: #{params.inspect}" 
  #   @profile = Profile.find(params[:id])
  # end

  # def show
  #   @profile = Profile.find_by(id: params[:id])
  #   if @profile.nil?
  #     redirect_to profiles_path, alert: "Profile not found."
  #   end
  # end

  def show
    @profile = Profile.find_by(id: params[:id])
    @interests = @profile.interests
    if @profile.nil?
      redirect_to profiles_path, alert: "Profile not found."
    else
      @user = @profile.user # Get the user associated with the profile
    end
  end

  def index
    @profiles = Profile.where.not(user: current_user)
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
    # Redirects the user if they attempt to access a profile that isn't their own
    unless @profile.user == current_user
      redirect_to profiles_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def profile_params
    puts params.inspect
    params.require(:profile).permit(:first_name, :last_name, :user_name, 
                                    :mbti_id, :gender_id, :degree_id, 
                                    :school_id, :program_id, :educational_background, 
                                    :profile_picture_url, :preferred_min_age, :preferred_max_age,
                                    :birthday, interest_ids: [])
  end
end
