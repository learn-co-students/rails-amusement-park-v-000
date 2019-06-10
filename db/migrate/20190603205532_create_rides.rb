class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :attraction, index: true, foreign_key: true

      t.timestamps
    end
  end
end
