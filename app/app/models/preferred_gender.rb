class PreferredGender < ApplicationRecord
  # Associations
  has_many :user_preferred_genders, dependent: :destroy
  has_many :users, through: :user_preferred_genders

  # Add any validations if needed
  validates :label, presence: true
end
