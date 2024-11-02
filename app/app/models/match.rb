class Match < ApplicationRecord
  belongs_to :requestor, class_name: 'Profile'
  belongs_to :receiver, class_name: 'Profile'
  has_many :conversations, dependent: :destroy

  validates :status, inclusion: { in: ['pending', 'accepted', 'declined'] }
end