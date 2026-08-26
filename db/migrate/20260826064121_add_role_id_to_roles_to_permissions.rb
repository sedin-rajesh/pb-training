class AddRoleIdToRolesToPermissions < ActiveRecord::Migration[8.1]
  def change
    add_column :roles_to_permissions, :role_id, :integer
  end
end
