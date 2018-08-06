class ChangeTicketsToBeIntegerInAttractions < ActiveRecord::Migration[5.2]
  def change
    change_column :attractions, :tickets, :integer
  end
end
