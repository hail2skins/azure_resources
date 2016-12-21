class AddLastModifiedToContainers < ActiveRecord::Migration[5.0]
  def change
    add_column :containers, :last_modified, :date
    add_index :containers, :last_modified
  end
end
