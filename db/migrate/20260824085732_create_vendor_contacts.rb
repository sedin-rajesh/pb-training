class CreateVendorContacts < ActiveRecord::Migration[8.1]
  def change
    create_table :vendor_contacts do |t|
      t.timestamps
    end
  end
end
