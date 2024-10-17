class UsersPreferredProgram < ApplicationRecord
  belongs_to :preference
  belongs_to :preferred_program
end
