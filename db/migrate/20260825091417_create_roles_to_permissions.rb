class CreateRolesToPermissions < ActiveRecord::Migration[8.1]
  def change
    create_table :roles_to_permissions do |t|
      t.integer :permission_id

      t.timestamps
    end
  end
end
