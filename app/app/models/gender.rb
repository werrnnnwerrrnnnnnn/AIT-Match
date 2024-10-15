class Gender < ApplicationRecord
  # A gender can be associated with many profiles.
  # has_many :profiles

  # Ensure each gender has a unique value and a label.
  validates :value, presence: true, uniqueness: true
  validates :label, presence: true
end
