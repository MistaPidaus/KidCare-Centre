class QuizSerializer < ActiveModel::Serializer
  attributes :id, :title, :course_id
  has_many :questions
  belongs_to :course
end
