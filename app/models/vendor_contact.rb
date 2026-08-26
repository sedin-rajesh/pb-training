class VendorContact < ApplicationRecord
  belongs_to :user
  has_many :dealer_to_vendors
end
