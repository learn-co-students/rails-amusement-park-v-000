class ChangeTicketColumnInAttractions < ActiveRecord::Migration[5.2]
  def change
    rename_column :attractions, :ticket_number, :tickets
  end
end
