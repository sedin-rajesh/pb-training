class AddUserReferenceToVendorContact < ActiveRecord::Migration[8.1]
  def change
    add_reference :vendor_contacts, :user, null: false, foreign_key: true
  end
end
