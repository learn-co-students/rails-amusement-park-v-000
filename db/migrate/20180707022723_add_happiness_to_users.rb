class AddHappinessToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :happiness, :integer
  end
end
