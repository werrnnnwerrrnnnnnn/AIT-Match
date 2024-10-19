class PreferredProgram < ApplicationRecord
  # Associations
  has_many :user_preferred_programs, dependent: :destroy
  has_many :users, through: :user_preferred_programs

  # Add any validations if needed
  validates :name, presence: true
end
