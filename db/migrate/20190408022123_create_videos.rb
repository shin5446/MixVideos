class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :content
      t.string :video_url
      t.string :image
      t.timestamps
    end
  end
end