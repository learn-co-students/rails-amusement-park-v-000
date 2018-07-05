class AddDefaultsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :nausea, :integer, :default => 0
    change_column :users, :happiness, :integer, :default => 5
    change_column :users, :tickets, :integer, :default => 0
    change_column :users, :height, :integer, :default => 60
  end
end
