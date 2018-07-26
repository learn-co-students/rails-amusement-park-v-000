class RenameMood < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :mood, :happiness
  end
end
