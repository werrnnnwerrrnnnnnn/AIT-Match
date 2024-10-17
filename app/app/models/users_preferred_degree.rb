class UsersPreferredDegree < ApplicationRecord
  belongs_to :preference
  belongs_to :preferred_degree
end
