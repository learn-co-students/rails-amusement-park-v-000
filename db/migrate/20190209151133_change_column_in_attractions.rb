class ChangeColumnInAttractions < ActiveRecord::Migration[5.2]
  def change
    rename_column :attractions, :hapiness_rating, :happiness_rating
  end
end
