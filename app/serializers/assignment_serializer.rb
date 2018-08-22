class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :assignment_file, :description, :total_score, :course_id
  belongs_to :course
  has_many :assignment_marks

  class AssignmentMarkSerializer < ActiveModel::Serializer
	attributes :id, :file, :marks, :user_id, :assignment_id
  end
end
