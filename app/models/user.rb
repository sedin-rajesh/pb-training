class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :roles
  has_one :dealer
  has_one :vendor_contact, dependent: :destroy
  has_many :dealer_to_vendors, through: :vendor_contact, dependent: :destroy
  belongs_to :vendor
  has_many :dealer_vendor_contacts, dependent: :destroy
  scope :search_by_name, ->(name) {
    name.present? ? where("user_name LIKE ?", "%#{sanitize_sql_like(name)}%") : all
  }
end
