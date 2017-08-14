class Ownership < ApplicationRecord
  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'
  belongs_to :owned_org, foreign_key: 'owned_org_id', class_name: 'Organization'
end
