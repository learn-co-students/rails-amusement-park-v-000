class AddNauseaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nausea, :integer
  end
end
