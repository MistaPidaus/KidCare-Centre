class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :assignment_file, :description, :course_id
  belongs_to :course
end
