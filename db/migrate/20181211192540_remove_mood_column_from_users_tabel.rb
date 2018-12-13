class RemoveMoodColumnFromUsersTabel < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :mood
  end
end
