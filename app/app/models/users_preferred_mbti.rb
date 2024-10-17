class UsersPreferredMbti < ApplicationRecord
  belongs_to :preference
  belongs_to :preferred_mbti
end
