class RemoveRoleIdFromPermissions < ActiveRecord::Migration[8.1]
  def change
    remove_column :permissions, :role_id, :integer
  end
end
