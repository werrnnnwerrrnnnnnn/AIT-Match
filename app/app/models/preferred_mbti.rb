class PreferredMbti < ApplicationRecord
  # Associations
  has_many :user_preferred_mbti, dependent: :destroy
  has_many :users, through: :user_preferred_mbti

  # Add any validations if needed
  validates :label, presence: true
end
