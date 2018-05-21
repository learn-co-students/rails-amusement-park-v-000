class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.references :user
      t.references :attraction

      t.timestamps
    end
  end
end
