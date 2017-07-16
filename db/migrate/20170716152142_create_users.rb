class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :current_emotion
      t.string :desired_mood
      t.references :song, index: true

      t.timestamps null: false
    end
  end
end
