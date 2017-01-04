class CreateNsgrules < ActiveRecord::Migration[5.0]
  def change
    create_table :nsgrules do |t|
      t.string :name
      t.string :nsg
      t.string :direction
      t.string :priority
      t.string :protocol
      t.string :source_port_range
      t.string :destination_port_range
      t.string :source_address_prefix
      t.string :destination_address_prefix
      t.string :access

      t.timestamps
    end
    add_index :nsgrules, :name
    add_index :nsgrules, :nsg
    add_index :nsgrules, :direction
    add_index :nsgrules, :priority
    add_index :nsgrules, :protocol
    add_index :nsgrules, :source_port_range
    add_index :nsgrules, :destination_port_range
    add_index :nsgrules, :source_address_prefix
    add_index :nsgrules, :destination_address_prefix
    add_index :nsgrules, :access
  end
end
