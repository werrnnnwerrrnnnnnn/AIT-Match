class School < ApplicationRecord
  # A school can be associated with many profiles.
  # has_many :profiles

  # Ensure each school has a unique name and abbreviation.
  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true
end
