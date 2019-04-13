class AddFieldsToRide < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :name, :string
    add_column :rides, :tickets, :integer
    add_column :rides, :nausea_rating, :integer
    add_column :rides, :happiness_rating, :integer
    add_column :rides, :min_height, :integer
  end
end
