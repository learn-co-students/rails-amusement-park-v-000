class RemoveMoodFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :mood, :string
  end
end
