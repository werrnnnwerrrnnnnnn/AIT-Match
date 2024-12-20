class Preference < ApplicationRecord
  belongs_to :user
  validates :preferred_min_age, :preferred_max_age, numericality: { only_integer: true }, allow_nil: true
  validate :age_range_validations

  # Direct associations with dependent destroy
  has_many :users_preferred_genders, dependent: :destroy
  has_many :users_preferred_degrees, dependent: :destroy
  has_many :users_preferred_schools, dependent: :destroy
  has_many :users_preferred_programs, dependent: :destroy
  has_many :users_preferred_relationships, dependent: :destroy
  has_many :users_preferred_interests, dependent: :destroy
  has_many :users_preferred_mbti, dependent: :destroy

  # Through associations
  has_many :preferred_genders, through: :users_preferred_genders, source: :preferred_gender
  has_many :preferred_degrees, through: :users_preferred_degrees, source: :preferred_degree
  has_many :preferred_schools, through: :users_preferred_schools, source: :preferred_school
  has_many :preferred_programs, through: :users_preferred_programs, source: :preferred_program
  has_many :preferred_relationships, through: :users_preferred_relationships, source: :preferred_relationship
  has_many :preferred_interests, through: :users_preferred_interests, source: :preferred_interest
  has_many :preferred_mbti, through: :users_preferred_mbti, source: :preferred_mbti

  #---------------------------Private---------------------------#
  private
  def age_range_validations
    if preferred_min_age.present? && preferred_min_age < 20
      errors.add(:preferred_min_age, "must be at least 20")
    end
    
    if preferred_min_age.present? && preferred_min_age < 0
      errors.add(:preferred_min_age, "can't be negative")
    end

    if preferred_max_age.present? && preferred_max_age < 0
      errors.add(:preferred_max_age, "can't be negative")
    end

    if preferred_min_age.present? && preferred_max_age.present? && preferred_min_age > preferred_max_age
      errors.add(:preferred_min_age, "must be less than or equal to Maximum age")
    end
  end
end
