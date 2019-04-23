class AddColumnToUserForOauth < ActiveRecord::Migration[5.2]
  def change
    add_column :users do |t|
      t.string :provider, null: false, default: ""
      t.string :uid, null: false, default: ""
    end
    add_index :users, [:uid, :provider], unique: true
  end
end