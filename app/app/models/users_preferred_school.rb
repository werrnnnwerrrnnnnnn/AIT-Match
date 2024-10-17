class UsersPreferredSchool < ApplicationRecord
  belongs_to :preference
  belongs_to :preferred_school
end
