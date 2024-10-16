class School < ApplicationRecord
  has_many :profiles

  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true

  def combined_name_abbreviation
    "#{name} (#{abbreviation})"
  end
end
