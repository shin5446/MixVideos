class RenameVideoUrlColumnToVideos < ActiveRecord::Migration[5.2]
  def change
    rename_column :videos, :video_url, :url
  end
end
