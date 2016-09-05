class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :episodes, :public, :boolean
    add_column :episodes, :owner_id, :integer, index: true
    add_foreign_key :episodes, :users, column: :owner_id
  end
end
