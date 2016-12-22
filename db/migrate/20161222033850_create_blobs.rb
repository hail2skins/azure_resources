class CreateBlobs < ActiveRecord::Migration[5.0]
  def change
    create_table :blobs do |t|
      t.string :name
      t.date :last_modified
      t.integer :length

      t.timestamps
    end
    add_index :blobs, :name
    add_index :blobs, :last_modified
    add_index :blobs, :length
  end
end
