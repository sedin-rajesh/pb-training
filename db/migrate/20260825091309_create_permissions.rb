class CreatePermissions < ActiveRecord::Migration[8.1]
  def change
    create_table :permissions do |t|
      t.string :menu
      t.string :submenu

      t.timestamps
    end
  end
end
