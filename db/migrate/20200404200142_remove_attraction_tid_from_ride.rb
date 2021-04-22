class RemoveAttractionTidFromRide < ActiveRecord::Migration[5.2]
  def change
    remove_column :rides, :attraction_tid, :integer
  end
end
