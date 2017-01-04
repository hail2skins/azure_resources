class CreateNsgs < ActiveRecord::Migration[5.0]
  def change
    create_table :nsgs do |t|
      t.string :name
      t.string :resource_group
      t.string :location
      t.string :provisioning_state

      t.timestamps
    end
    add_index :nsgs, :name
    add_index :nsgs, :resource_group
    add_index :nsgs, :location
  end
end
