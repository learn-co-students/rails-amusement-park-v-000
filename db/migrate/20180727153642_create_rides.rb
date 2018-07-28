class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.belongs_to :attraction
      t.belongs_to :user
      t.timestamps
    end
  end
end
