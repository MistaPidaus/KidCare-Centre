class AssignmentMarkSerializer < ActiveModel::Serializer
  attributes :id, :file, :marks, :user_id, :assignment_id
end
