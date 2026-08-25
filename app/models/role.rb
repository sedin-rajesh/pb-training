class Role < ApplicationRecord
  has_many :roles_to_permissions
  has_many :permissions, through: :roles_to_permissions
end
