class JobPostingSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :responsibilities, :qualifications, :ap_number
  belongs_to :organization
  has_many :applications
  has_many :users, through: :applications
  has_many :locations, as: :locatable
end
