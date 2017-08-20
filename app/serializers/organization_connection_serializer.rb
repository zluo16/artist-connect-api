class OrganizationConnectionSerializer < ActiveModel::Serializer
  attributes :id, :org_connector_id, :connected_org_id
  belongs_to :org_connector, foreign_key: 'org_connector_id', class_name: 'User'
  belongs_to :connected_org, foreign_key: 'connected_org_id', class_name: 'Organization'
  has_secure_password
end
