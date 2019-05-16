class CreateRides < ActiveRecord::Migration[4.2]
  def change
    create_table :rides do |t|
      t.belongs_to :user
      t.belongs_to :attraction
      t.timestamps null: false
    end
  end
end
