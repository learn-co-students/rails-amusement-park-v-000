class RenameAttracions < ActiveRecord::Migration[5.2]
  def change
    rename_table :attracions, :attractions
  end
end
