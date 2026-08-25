class AddRoleIdToRolesToPermission < ActiveRecord::Migration[8.1]
  def change
    add_column :permissions, :role_id, :integer
  end
end
