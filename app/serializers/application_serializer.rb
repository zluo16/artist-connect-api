class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :resume, :cover_letter
  belongs_to :user
  belongs_to :job_posting
end
