class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.belongs_to :user
      t.belongs_to :attraction
    end
  end
end
