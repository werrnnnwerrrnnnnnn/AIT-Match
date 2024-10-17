class PreferredInterest < ApplicationRecord
  # Associations
  has_many :user_preferred_interests, dependent: :destroy
  has_many :users, through: :user_preferred_interests

  # Add any validations if needed
  validates :name, presence: true
end
