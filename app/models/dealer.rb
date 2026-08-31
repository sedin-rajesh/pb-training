class Dealer < ApplicationRecord
  has_many :dealer_to_vendors, dependent: :destroy
  has_many :vendors, through: :dealer_to_vendors
  has_many :dealer_vendor_contacts
end
