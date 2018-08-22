class AssignmentMarkSerializer < ActiveModel::Serializer
  attributes :id, :file, :marks, :user_id, :assignment_id
  belongs_to :assignment
  belongs_to :user

  class AssignmentSerializer < ActiveModel::Serializer
  	attributes :id, :title, :assignment_file, :description, :total_score, :course_id
  end
end
