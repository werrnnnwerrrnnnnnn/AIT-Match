class Match < ApplicationRecord
  belongs_to :requestor, class_name: 'Profile'
  belongs_to :receiver, class_name: 'Profile'

  validates :status, inclusion: { in: ['pending', 'accepted', 'declined'] }
end