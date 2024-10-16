class Mbti < ApplicationRecord
  has_many :profiles

  validates :value, presence: true, uniqueness: true
  validates :label, presence: true

  def combined_value_label
    value == 'not-sure' ? label : "#{value} (#{label})"
  end
end
