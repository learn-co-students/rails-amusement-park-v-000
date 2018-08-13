class ChangeUsersNauseaToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :nausea, :integer
  end
end
