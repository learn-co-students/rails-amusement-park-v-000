class EntirelyChangeRide < ActiveRecord::Migration[5.2]
  def change
    remove_column :rides, :name, :string
    remove_column :rides, :tickets, :integer
    remove_column :rides, :nausea_rating, :integer
    remove_column :rides, :happiness_rating, :integer
    remove_column :rides, :min_height, :integer
    add_column :rides, :user_id, :integer
    add_column :rides, :attraction_id, :integer

  end
end
