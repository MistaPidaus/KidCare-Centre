class CertificateSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :file, :course_id
  has_one :course
end
