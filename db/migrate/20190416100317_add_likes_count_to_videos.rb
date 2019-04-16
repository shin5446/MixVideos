class AddLikesCountToVideos < ActiveRecord::Migration[5.2]
  def self.up
    add_column :videos, :likes_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :videos, :likes_count
  end
end
