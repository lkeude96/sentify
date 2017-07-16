require "csv"

CSV.foreach("training_urls/songs_frame.csv", headers:true) do |record|
	Song.create(song_name: record["song_name"], spotify_id: record["spotify_id"])
end