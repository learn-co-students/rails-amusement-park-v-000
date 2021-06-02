class ChangeUserAdminDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :admin, 0
  end
end
