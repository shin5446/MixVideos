class CreateVideoGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :video_genres do |t|
      t.references :genre, foreign_key: true
      t.references :video, foreign_key: true

      t.timestamps
    end
  end
end
