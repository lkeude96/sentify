json.extract! song_tag, :id, :song_id, :tag_name, :created_at, :updated_at
json.url song_tag_url(song_tag, format: :json)
