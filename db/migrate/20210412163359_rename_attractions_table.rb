class RenameAttractionsTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :attactions, :attractions
  end
end
