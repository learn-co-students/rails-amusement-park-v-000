class ChangeAttracionIdInRides < ActiveRecord::Migration[5.2]
  def change
    rename_column :rides, :attracion_id, :attraction_id
  end
end
