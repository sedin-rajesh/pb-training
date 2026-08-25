class AddNameToRole < ActiveRecord::Migration[8.1]
  def change
    add_column :roles, :name, :string
  end
end
