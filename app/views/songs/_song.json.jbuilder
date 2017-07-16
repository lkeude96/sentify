json.extract! song, :id, :spotify_id, :song_name, :genre_id, :created_at, :updated_at
json.url song_url(song, format: :json)
