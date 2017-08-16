class UserConnectionSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :connector, foreign_key: 'connector_id', class_name: 'User'
  belongs_to :connection, foreign_key: 'connectee_id', class_name: 'User'
end
