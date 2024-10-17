class ProfilePreferredGender < ApplicationRecord
  belongs_to :profile
  belongs_to :gender
end
