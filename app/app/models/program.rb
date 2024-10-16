class Program < ApplicationRecord
  has_many :profiles

  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true, allow_blank: true

  def combined_name_abbreviation
    abbreviation.present? ? "#{name} (#{abbreviation})" : name
  end
end
