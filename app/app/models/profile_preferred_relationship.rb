class ProfilePreferredRelationship < ApplicationRecord
  belongs_to :profile
  belongs_to :preferred_relationship
end
