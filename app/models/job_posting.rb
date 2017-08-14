class JobPosting < ApplicationRecord
  belongs_to :organization
  has_many :applications
  has_many :users, through: :applications
  has_many :locations
end
