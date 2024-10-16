class ProfilesController < ApplicationController
  # Only allow signed-in users to access profile actions
  before_action :authenticate_user!

  def new
    @profile = Profile.new
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

  def show
    @profile = Profile.find_by(id: params[:id])
    if @profile.nil?
      redirect_to profiles_path, alert: "Profile not found."
    end
  end

  def index
    @profiles = Profile.includes(:user).all
  end

  private

  def profile_params
    puts params.inspect
    params.require(:profile).permit(:first_name, :last_name, :user_name, :age, :mbti_id, :gender_id, :degree_id, :school_id, :program_id, :educational_background, :profile_picture_url, :preferred_min_age, :preferred_max_age)
  end
end
