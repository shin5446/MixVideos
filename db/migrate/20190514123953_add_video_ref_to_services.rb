class AddVideoRefToServices < ActiveRecord::Migration[5.2]
  def change
    add_reference :services, :video, foreign_key: true
  end
end
