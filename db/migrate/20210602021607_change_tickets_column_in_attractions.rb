class ChangeTicketsColumnInAttractions < ActiveRecord::Migration[5.2]
  def change 
    change_table :attractions do |t|
    t.rename :ticket_number, :tickets
  end
end 
end
