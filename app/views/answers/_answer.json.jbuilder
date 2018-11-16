json.extract! answer, :id, :answer, :correct, :question_id, :created_at, :updated_at
json.url answer_url(answer, format: :json)
