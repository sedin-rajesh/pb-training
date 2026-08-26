class Dealer < ApplicationRecord
  has_many :dealer_to_vendors
  has_many :vendors, through: :dealer_to_vendors
end
