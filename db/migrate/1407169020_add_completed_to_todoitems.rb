class AddCompletedToTodoitems < ActiveRecord::Migration
  def up
    add_column :to_do_items, :completed,  :boolean
    add_column :to_do_items, :user_id, :integer
  end

  def down
    remove_column :to_do_items, :completed, :boolean
    remove_column :to_do_items, :user_id, :integer
  end
end
