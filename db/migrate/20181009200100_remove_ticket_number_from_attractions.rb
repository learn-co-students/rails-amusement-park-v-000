class RemoveTicketNumberFromAttractions < ActiveRecord::Migration[5.2]
  def change
    remove_column :attractions, :ticket_number, :integer
  end
end
