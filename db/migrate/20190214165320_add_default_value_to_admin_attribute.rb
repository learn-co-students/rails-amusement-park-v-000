class AddDefaultValueToAdminAttribute < ActiveRecord::Migration[5.2]


  def up
    change_column :users, :admin, :boolean, default: false
  end

  def down
    change_column :users, :admin, :boolean, default: nil
  end
end
