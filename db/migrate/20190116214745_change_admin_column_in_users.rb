class ChangeAdminColumnInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :admin, from: true, to: false
  end
end
