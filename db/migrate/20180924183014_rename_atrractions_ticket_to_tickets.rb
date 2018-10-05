class RenameAtrractionsTicketToTickets < ActiveRecord::Migration[5.2]
  def change
    rename_column :Attractions, :ticket, :tickets
  end
end
