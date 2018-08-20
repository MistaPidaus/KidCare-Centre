class CourseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :picture, :published, :college_id, :creator_id
  has_many :unit
  has_many :assignment
  has_one :certificate
  belongs_to :college
  belongs_to :creator
  
  class UnitSerializer < ActiveModel::Serializer
	attributes :id, :title, :description
  end

  class CollegeSerializer < ActiveModel::Serializer
	attributes :id, :name
  end

end
