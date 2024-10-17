class ProfileRelationship < ApplicationRecord
  belongs_to :profile
  belongs_to :relationship
end
