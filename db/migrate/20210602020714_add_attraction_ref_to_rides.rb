class AddAttractionRefToRides < ActiveRecord::Migration[5.2]
  def change
    add_reference :rides, :attraction, foreign_key: true
  end
end
