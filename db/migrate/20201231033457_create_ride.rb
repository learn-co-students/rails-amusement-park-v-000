class CreateRide < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.belongs_to :user
      t.belongs_to :attraction 
    end
  end
end
