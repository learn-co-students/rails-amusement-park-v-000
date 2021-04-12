class AddMinHeightToAttractions < ActiveRecord::Migration[5.2]
  def change
    add_column :attractions, :min_height, :integer
  end
end
