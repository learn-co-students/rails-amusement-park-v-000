class AddMoodToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mood, :string
  end
end
