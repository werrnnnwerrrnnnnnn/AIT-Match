class Interest < ApplicationRecord
  # Many profiles can have many interests (through a join table).
  # has_many :profile_interests
  # has_many :profiles, through: :profile_interests

  # Ensure each interest has a name.
  validates :name, presence: true, uniqueness: true
end
