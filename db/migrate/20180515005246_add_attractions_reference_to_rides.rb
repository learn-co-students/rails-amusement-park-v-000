class AddAttractionsReferenceToRides < ActiveRecord::Migration[5.2]
  def change
    add_reference :rides, :attractions, foreign_key: true
  end
end
