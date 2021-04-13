class RemoveMinHeightFromAttractions < ActiveRecord::Migration[5.2]
  def change
    remove_column :attractions, :min_height, :string
  end
end
