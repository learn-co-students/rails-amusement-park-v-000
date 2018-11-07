class RenameHappyToHappiness < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :happy, :happiness
  end
end
