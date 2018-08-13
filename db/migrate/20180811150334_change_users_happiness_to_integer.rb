class ChangeUsersHappinessToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :happiness, :integer
  end
end
