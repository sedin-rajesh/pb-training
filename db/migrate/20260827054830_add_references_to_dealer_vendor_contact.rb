class AddReferencesToDealerVendorContact < ActiveRecord::Migration[8.1]
  def change
    add_foreign_key :dealer_vendor_contacts, :vendors
    add_foreign_key :dealer_vendor_contacts, :dealers
  end
end
