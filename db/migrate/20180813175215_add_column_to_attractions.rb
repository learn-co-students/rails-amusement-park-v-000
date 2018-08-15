class AddColumnToAttractions < ActiveRecord::Migration[5.2]
  def change
    add_column :attractions, :name, :string
    add_column :attractions, :tickets, :integer
    add_column :attractions, :nausea_rating, :integer
    add_column :attractions, :happiness_rating, :integer
    add_column :attractions, :min_height, :integer 
  end
end
