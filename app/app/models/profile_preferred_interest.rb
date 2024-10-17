class ProfilePreferredInterest < ApplicationRecord
  belongs_to :profile
  belongs_to :interest
end
