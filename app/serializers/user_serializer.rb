class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :stage_name, :email, :dob, :friends
  has_many :conn_relationships, foreign_key: :connector_id, class_name: 'UserConnection'
  has_many :connections, through: :conn_relationships, source: :connection

  has_many :org_connects, foreign_key: :org_connector_id, class_name: 'OrganizationConnection'
  has_many :connected_orgs, through: :org_connects, source: :connected_org

  has_many :org_ownerships, foreign_key: :owner_id, class_name: 'Ownership'
  has_many :owned_orgs, through: :org_ownerships, source: :owned_org

  has_many :locations, as: :locatable
  has_many :experiences
  has_many :educations
  has_many :skills
end
