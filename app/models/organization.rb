class Organization < ApplicationRecord
  has_many :job_postings
  has_many :applications, through: :job_postings
  has_many :tags

  has_many :ownerships, foreign_key: :owned_org_id, class_name: 'Ownership'
  has_many :owners, through: :ownerships, source: :owner
end
