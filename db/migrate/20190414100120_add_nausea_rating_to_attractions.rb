class AddNauseaRatingToAttractions < ActiveRecord::Migration[5.2]
  def change
    add_column :attractions, :nausea_rating, :integer
  end
end
