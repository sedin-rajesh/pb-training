class CreateDealerToVendors < ActiveRecord::Migration[8.1]
  def change
    create_table :dealer_to_vendors do |t|
      t.string :vendor_dealer_id
      t.references :vendor, null: false, foreign_key: true
      t.references :dealer, null: false, foreign_key: true
      t.references :vendor_contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
