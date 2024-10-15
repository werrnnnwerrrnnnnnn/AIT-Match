class Relationship < ApplicationRecord
  has_many :profiles

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
