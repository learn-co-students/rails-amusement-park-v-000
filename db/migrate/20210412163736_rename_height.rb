class RenameHeight < ActiveRecord::Migration[5.2]
  def change
    rename_column :attractions, :minimum_height, :min_height
  end
end
