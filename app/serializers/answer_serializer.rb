class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :answer, :correct, :question_id
end
