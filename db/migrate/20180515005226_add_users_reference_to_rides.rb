class AddUsersReferenceToRides < ActiveRecord::Migration[5.2]
  def change
    add_reference :rides, :users, foreign_key: true
  end
end
