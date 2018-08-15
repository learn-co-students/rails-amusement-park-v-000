class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :admin, :boolean
    add_column :users, :admin, :boolean, default: false
  end
end
