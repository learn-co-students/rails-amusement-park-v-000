class ChangeHappinessAndNauseaDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :happiness, 0)
    change_column_default(:users, :nausea, 0)
  end
end