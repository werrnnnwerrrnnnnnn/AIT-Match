class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :mbti, optional: true
  belongs_to :gender, optional: true
  belongs_to :degree, optional: true
  belongs_to :school, optional: true
  belongs_to :program, optional: true

  has_many :profile_preferred_genders
  has_many :profile_interests
  has_many :profile_preferred_interests
  has_many :profile_relationships
  has_many :profile_preferred_relationships
end
