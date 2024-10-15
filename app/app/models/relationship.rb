class Relationship < ApplicationRecord
  # A relationship type can be associated with many profiles.
  # has_many :profiles

  # Ensure each relationship has a unique name and description.
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
