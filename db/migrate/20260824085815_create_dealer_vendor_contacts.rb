class CreateDealerVendorContacts < ActiveRecord::Migration[8.1]
  def change
    create_table :dealer_vendor_contacts do |t|
      t.timestamps
    end
  end
end
