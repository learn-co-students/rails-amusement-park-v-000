class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.references :user, foreign_key: true
      t.references :attraction, foreign_key: true

      t.timestamps
    end
  end
end
