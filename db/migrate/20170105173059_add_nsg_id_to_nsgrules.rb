class AddNsgIdToNsgrules < ActiveRecord::Migration[5.0]
  def change
  	add_column :nsgrules, :nsg_id, :integer
  	add_index :nsgrules, :nsg_id
  end
end
