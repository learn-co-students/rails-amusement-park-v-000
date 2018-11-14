class UpdateColumnNameOnUsers < ActiveRecord::Migration[5.2]
  def change
		rename_column :users, :owner, :user_admin
  end
end
