class AddTaskToPermissions < ActiveRecord::Migration[8.1]
  def change
    add_column :permissions, :task, :string
  end
end
