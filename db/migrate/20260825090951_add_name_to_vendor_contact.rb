class AddNameToVendorContact < ActiveRecord::Migration[8.1]
  def change
    add_column :vendor_contacts, :name, :string
  end
end
