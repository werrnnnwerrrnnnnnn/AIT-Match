class Report < ApplicationRecord
  belongs_to :reporter_profile, class_name: 'Profile'
  belongs_to :reported_profile, class_name: 'Profile'

  validates :reason, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending reviewed] }
end
