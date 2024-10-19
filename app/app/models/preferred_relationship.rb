class PreferredRelationship < ApplicationRecord
  # Associations
  has_many :user_preferred_relationships, dependent: :destroy
  has_many :users, through: :user_preferred_relationships

  # Add any validations if needed
  validates :name, presence: true
end
