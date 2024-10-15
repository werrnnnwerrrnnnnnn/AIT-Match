class Program < ApplicationRecord
  # A program can be associated with many profiles.
  # has_many :profiles

  # Ensure each program has a unique name and abbreviation.
  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true, allow_blank: true
end
