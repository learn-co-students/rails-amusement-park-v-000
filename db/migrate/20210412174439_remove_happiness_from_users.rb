class RemoveHappinessFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :happiness, :string
  end
end
