class JobPosting < ApplicationRecord
  belongs_to :organization
  has_many :applications
  has_many :users, through: :applications
  has_many :locations, as: :locatable

  def ap_number
    aps = Application.all.select{|a| a.job_posting_id == self.id}.length
  end
end
