class Vendor < ApplicationRecord
  has_many :dealer_to_vendors
  has_many :vendor_contacts, through: :dealer_to_vendors
  has_many :users
end
