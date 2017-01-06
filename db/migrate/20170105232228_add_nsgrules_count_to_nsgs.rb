class AddNsgrulesCountToNsgs < ActiveRecord::Migration[5.0]
  def change
    add_column :nsgs, :nsgrules_count, :integer
    add_index :nsgs, :nsgrules_count
  end
end
