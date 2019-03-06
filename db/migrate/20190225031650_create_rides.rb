class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.belongs_to :user, index: true
      t.belongs_to :attraction, index: true
    end
  end
end
