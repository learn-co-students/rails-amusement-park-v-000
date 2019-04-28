class SetUsersDefaults < ActiveRecord::Migration[5.2]
  def self.up
    change_column :users, :happiness, :integer, default: 3
    change_column :users, :nausea, :integer, default: 1
    change_column :users, :tickets, :integer, default: 5
    change_column :users, :height, :integer, default: 60
  end

  def self.down
    change_column :users, :happiness, :integer, default: 3
    change_column :users, :nausea, :integer, default: 1
    change_column :users, :tickets, :integer, default: 5
    change_column :users, :height, :integer, default: 60
  end
end
