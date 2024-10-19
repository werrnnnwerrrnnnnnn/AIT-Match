class PreferencesController < ApplicationController
  before_action :set_preference, only: [:edit, :update]

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
end
