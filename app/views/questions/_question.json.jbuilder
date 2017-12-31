json.extract! question, :id, :name, :user, :created_at, :updated_at
json.url question_url(question, format: :json)
