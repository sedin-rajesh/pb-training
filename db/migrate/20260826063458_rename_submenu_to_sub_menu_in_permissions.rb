class RenameSubmenuToSubMenuInPermissions < ActiveRecord::Migration[8.1]
  def change
    rename_column :permissions, :submenu, :sub_menu
  end
end
