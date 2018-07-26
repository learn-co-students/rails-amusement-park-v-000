class DropRidesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :rides
  end
end
