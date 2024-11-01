class PreferencesController < ApplicationController
  before_action :set_preference, only: [:edit, :update]
  before_action :authenticate_user!
  before_action :check_profile_completion

  def new
    @preference = Preference.new
    load_filter_options
  end

  def create
    @preference = current_user.build_preference(preference_params)
    if @preference.save
      redirect_to profiles_path, notice: 'Preferences were successfully set.'
    else
      load_filter_options
      render :new
    end
  end

  def edit
    load_filter_options
  end

  def update
    if @preference.update(preference_params)
      redirect_to profiles_path, notice: 'Preferences were successfully updated.'
    else
      load_filter_options
      render :edit
    end
  end

  private

  def set_preference
    @preference = current_user.preference || current_user.build_preference
  end

  def load_filter_options
    @preferred_genders = PreferredGender.all
    @preferred_schools = PreferredSchool.all
    @preferred_programs = PreferredProgram.all
    @preferred_degrees = PreferredDegree.all
    @preferred_relationships = PreferredRelationship.all
    @preferred_interests = PreferredInterest.all
    @preferred_mbti = PreferredMbti.all
  end

  def preference_params
    params.require(:preference).permit(
      :preferred_min_age, :preferred_max_age, 
      preferred_gender_ids: [], preferred_school_ids: [], 
      preferred_program_ids: [], preferred_degree_ids: [], 
      preferred_relationship_ids: [], preferred_interest_ids: [], 
      preferred_mbti_ids: []
    )
  end

  def apply_filters(preference)
    # Start with filtered profiles
    @filtered_profiles = @filtered_profiles.select('profiles.*').distinct

    # Filter by age range
    if preference.preferred_min_age.present? && preference.preferred_max_age.present?
      today = Date.today
      min_birthdate = today.years_ago(preference.preferred_max_age)
      max_birthdate = today.years_ago(preference.preferred_min_age)
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

  #-----------------------------Private------------------------------------#
  private
  def check_profile_completion
    if current_user.profile.nil?
      flash[:alert] = "Please complete your profile before accessing this page."
      redirect_to new_profile_path
    end
  end
  
end