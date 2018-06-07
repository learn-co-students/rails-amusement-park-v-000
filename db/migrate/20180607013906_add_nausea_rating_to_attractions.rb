class AddNauseaRatingToAttractions < ActiveRecord::Migration[5.2]
  def change
    remove_column :attractions, :integer, :string
    remove_column :attractions, :nausea_rating, :string
    add_column :attractions, :nausea_rating, :integer
  end
end
