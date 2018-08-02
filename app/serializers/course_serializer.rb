class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :picture, :published, :college_id
  has_many :unit
  class UnitSerializer < ActiveModel::Serializer
	attributes :id, :title, :description
  end

end
