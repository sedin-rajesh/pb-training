class AddUserReferenceToDealerToVendor < ActiveRecord::Migration[8.1]
  def change
    add_reference :dealer_to_vendors, :user, foreign_key: true
  end
end
