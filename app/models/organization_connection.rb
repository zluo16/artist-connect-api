class OrganizationConnection < ApplicationRecord
  belongs_to :org_connector, foreign_key: 'org_connector_id', class_name: 'User'
  belongs_to :connected_org, foreign_key: 'connected_org_id', class_name: 'Organization'
end
