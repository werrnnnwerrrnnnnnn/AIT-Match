class Degree < ApplicationRecord
  # A degree can be associated with many profiles (assuming users have degrees).
  # has_many :profiles

  # Ensure each degree has a unique value and a label.
  validates :value, presence: true, uniqueness: true
  validates :label, presence: true
end
