class ChangeRides < ActiveRecord::Migration[5.2]
  def change
    change_table :rides do |t|
      t.remove :user_id
      t.remove :attraction_id
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :attraction, index: true, foreign_key: true
    end
  end
end
