class PreferredMbti < ApplicationRecord
  # has_many :profile_preferred_mbti
  # has_many :profiles, through: :profile_preferred_mbti

  validates :value, presence: true, uniqueness: true
  validates :label, presence: true
end
