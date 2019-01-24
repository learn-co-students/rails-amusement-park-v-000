class RemoveAdminFromAttractionsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :attractions, :admin
  end
end
