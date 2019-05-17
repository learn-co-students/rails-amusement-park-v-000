
class RemovePasswordFromUsers < ActiveRecord::Migration[5.2]

  def change
    remove_column :users, :password, :string
    add_column :users, :password_digest, :string
    add_column :users, :admin, :boolean, default: false
  end 

end
