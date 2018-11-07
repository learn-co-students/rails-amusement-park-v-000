class AddOwnerFieldToUsers < ActiveRecord::Migration[5.2]
  def change
		add_column :users, :owner, :boolean, default: :false
  end
end
