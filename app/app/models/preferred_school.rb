class PreferredSchool < ApplicationRecord
  # Associations
  has_many :user_preferred_schools, dependent: :destroy
  has_many :users, through: :user_preferred_schools

  # Add any validations if needed
  validates :name, presence: true
end
