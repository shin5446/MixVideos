class AddServiceRefToVideos < ActiveRecord::Migration[5.2]
  def change
    add_reference :videos, :service, foreign_key: true
  end
end
