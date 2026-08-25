class AddNameToDealerVendorContact < ActiveRecord::Migration[8.1]
  def change
    add_column :dealer_vendor_contacts, :name, :string
  end
end
