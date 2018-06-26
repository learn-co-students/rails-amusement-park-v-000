class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :attraction, foreign_key: true
    end
  end
end
