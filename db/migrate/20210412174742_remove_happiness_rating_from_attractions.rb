class RemoveHappinessRatingFromAttractions < ActiveRecord::Migration[5.2]
  def change
    remove_column :attractions, :happiness_rating, :string
  end
end
