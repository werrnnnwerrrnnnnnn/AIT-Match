class UsersPreferredGender < ApplicationRecord
  belongs_to :preference
  belongs_to :preferred_gender
end
