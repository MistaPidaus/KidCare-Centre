class CertificateSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :file, :course_id
  belongs_to :course
end
