class UsersPreferredRelationship < ApplicationRecord
  belongs_to :preference
  belongs_to :preferred_relationship
end
