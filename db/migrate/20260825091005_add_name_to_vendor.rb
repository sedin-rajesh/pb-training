class AddNameToVendor < ActiveRecord::Migration[8.1]
  def change
    add_column :vendors, :name, :string
  end
end
