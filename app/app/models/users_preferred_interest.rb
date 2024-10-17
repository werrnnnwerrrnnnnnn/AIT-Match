class UsersPreferredInterest < ApplicationRecord
  belongs_to :preference
  belongs_to :preferred_interest
end
