class AddAdminDefaultToUsers < ActiveRecord::Migration[4.2]
  def change
    change_column :users, :admin, :boolean, :default => false
  end
end
