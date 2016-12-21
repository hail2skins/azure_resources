class CreateContainers < ActiveRecord::Migration[5.0]
  def change
    create_table :containers do |t|
      t.string :name
      t.boolean :public_access

      t.timestamps
    end
    add_index :containers, :name
  end
end
