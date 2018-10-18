class ChangeColumnNameInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :password_digest, :password
  end
end
