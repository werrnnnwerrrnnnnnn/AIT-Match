class Degree < ApplicationRecord
  has_many :profiles

  validates :value, presence: true, uniqueness: true
  validates :label, presence: true
end
