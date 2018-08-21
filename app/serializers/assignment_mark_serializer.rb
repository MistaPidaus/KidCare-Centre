class AssignmentMarkSerializer < ActiveModel::Serializer
  attributes :id, :file, :marks, :user_id, :assignment_id
  belongs_to :assignment

  class AssignmentSerializer < ActiveModel::Serializer
  	attributes :id, :title, :assignment_file, :description, :course_id
  end
end
