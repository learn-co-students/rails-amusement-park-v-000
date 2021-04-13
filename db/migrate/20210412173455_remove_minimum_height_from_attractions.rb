class RemoveMinimumHeightFromAttractions < ActiveRecord::Migration[5.2]
  def change
    remove_column :attractions, :minimum_height, :integer
  end
end
