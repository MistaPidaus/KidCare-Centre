class UnitSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :picture, :attachment, :course_id
  belongs_to :course
  has_many :assignment
end
