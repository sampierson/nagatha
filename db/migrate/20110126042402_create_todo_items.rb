class CreateTodoItems < ActiveRecord::Migration
  def self.up
    create_table :todo_items do |t|
      t.string :description
      t.integer :position
      t.integer :user_id
      t.datetime :completed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :todo_items
  end
end
