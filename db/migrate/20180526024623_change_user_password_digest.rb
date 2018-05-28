class ChangeUserPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :password_validation, :password_digest
  end
end
