class Permission < ApplicationRecord
  has_many :roles_to_permissions
  has_many :roles, through: :roles_to_permissions
end
