class ChangeOwnerFieldToAdminOnUsers < ActiveRecord::Migration[5.2]
  def change
		rename_column :users, :user_admin, :admin
  end
end
