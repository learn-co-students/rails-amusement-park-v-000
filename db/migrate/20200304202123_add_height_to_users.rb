class AddHeightToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :height, :integer
  end
end
