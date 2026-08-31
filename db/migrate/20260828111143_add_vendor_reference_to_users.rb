class AddVendorReferenceToUsers < ActiveRecord::Migration[8.1]
  def change
    add_reference :users, :vendor, foreign_key: true
  end
end
