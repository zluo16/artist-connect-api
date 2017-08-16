class LocationSerializer < ActiveModel::Serializer
  attributes :id, :address, :city, :state, :suite, :zipcode, :main
  belongs_to :locatable, polymorphic: true
end
