class ChangeTicketsToBeIntegerInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :tickets, :integer
  end
end
