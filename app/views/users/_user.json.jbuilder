json.extract! user, :id, :name, :current_emotion, :desired_mood, :song_id, :created_at, :updated_at
json.url user_url(user, format: :json)
