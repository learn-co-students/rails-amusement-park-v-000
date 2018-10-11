class AddTicketsToAttractions < ActiveRecord::Migration[5.2]
  def change
    add_column :attractions, :tickets, :integer
  end
end
