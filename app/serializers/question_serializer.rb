class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question, :quiz_id
end
