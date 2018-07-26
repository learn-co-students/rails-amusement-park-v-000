class AddHappinessToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :happiness, :string
  end
end
