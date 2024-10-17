class PreferredDegree < ApplicationRecord
  # Associations
  has_many :user_preferred_degrees, dependent: :destroy
  has_many :users, through: :user_preferred_degrees

  # Add any validations if needed
  validates :label, presence: true
end
