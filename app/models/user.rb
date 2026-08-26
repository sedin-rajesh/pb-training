class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :roles
  has_one :vendor
  has_one :dealer
  has_one :vendor_contact
  scope :search_by_name, ->(name) {
    name.present? ? where("name LIKE ?", "%#{sanitize_sql_like(name)}%") : all
  }
end
