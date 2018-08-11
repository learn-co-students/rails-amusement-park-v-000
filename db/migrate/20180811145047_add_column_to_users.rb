class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nausea, :string
  end
end
