json.extract! course, :id, :title, :description, :picture, :published, :college_id, :created_at, :updated_at
json.url course_url(course, format: :json)
