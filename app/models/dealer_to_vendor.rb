class DealerToVendor < ApplicationRecord
  belongs_to :vendor
  belongs_to :dealer
  belongs_to :vendor_contact
end
