class AddStatusToTodoItems < ActiveRecord::Migration
  def self.up
    add_column :todo_items, :status, :string, :default => 'undone'
    add_index :todo_items, :status
  end

  def self.down
    remove_column :todo_items, :status
  end
end
