class AddTicketsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tickets, :integer
    add_column :users, :admin, :boolean
  end
end
