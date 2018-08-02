class AssignmentSerializer < ActiveModel::Serializer
  attributes :id, :title, :file, :description, :unit_id
  belongs_to :unit
end
