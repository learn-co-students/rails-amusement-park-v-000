class RenameNauseousToNausea < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :nauseous, :nausea
  end
end
