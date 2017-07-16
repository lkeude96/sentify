class CreateSongTags < ActiveRecord::Migration
  def change
    create_table :song_tags do |t|
      t.references :song, index: true, foreign_key: true
      t.string :tag_name

      t.timestamps null: false
    end
  end
end
