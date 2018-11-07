class RenameDollarsToTickets < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :dollars, :tickets
  end
end
