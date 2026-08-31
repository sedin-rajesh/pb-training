class AddIdsToDealerVendorContact < ActiveRecord::Migration[8.1]
  def change
    add_column :dealer_vendor_contacts, :dealer_id, :string
    add_column :dealer_vendor_contacts, :vendor_id, :string
  end
end
