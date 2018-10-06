class AddAttractionIdToRides < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :attraction_id, :integer
  end
end
