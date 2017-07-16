class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :spotify_id
      t.string :song_name
      t.references :genre, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
