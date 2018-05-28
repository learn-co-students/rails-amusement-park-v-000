class ChangeUserHappiness < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :happines, :happiness
  end
end
