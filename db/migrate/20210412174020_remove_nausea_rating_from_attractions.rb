class RemoveNauseaRatingFromAttractions < ActiveRecord::Migration[5.2]
  def change
    remove_column :attractions, :nausea_rating, :string
  end
end
