class AddStatusToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :status, :integer, default: 1, null: false, limit: 1
  end
end
