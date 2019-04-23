class AddColumnToUserForOauth < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :provider, :string, null: false, default: ""
      add_column :users, :uid, :string, null: false, default: ""
    end
    add_index :users, [:uid, :provider], unique: true
  end
end