class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :picture, :published, :college_id
  has_many :unit
  has_one :certificate
  belongs_to :college
  
  class UnitSerializer < ActiveModel::Serializer
	attributes :id, :title, :description
  end

  class CollegeSerializer < ActiveModel::Serializer
	attributes :id, :name
  end

end
