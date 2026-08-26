# db/seeds.rb

puts "========================================"
puts "CLEARING EXISTING DATA"
puts "========================================"

RolesToPermission.delete_all
DealerToVendor.delete_all
VendorContact.delete_all
Permission.delete_all
Role.delete_all
Dealer.delete_all
Vendor.delete_all
User.delete_all

puts "Existing data cleared."

# ============================================================
# USERS
# ============================================================

puts
puts "========================================"
puts "CREATING USERS"
puts "========================================"

users = User.create!([
  {
    user_name: "rajesh",
    firstname: "Rajesh",
    lastname: "S",
    email: "rajesh@example.com",
    password: "Password@123"
  },
  {
    user_name: "john",
    firstname: "John",
    lastname: "Doe",
    email: "john@example.com",
    password: "Password@123"
  },
  {
    user_name: "smith",
    firstname: "Smith",
    lastname: "Kumar",
    email: "smith@example.com",
    password: "Password@123"
  },
  {
    user_name: "admin",
    firstname: "Admin",
    lastname: "User",
    email: "admin@example.com",
    password: "Password@123"
  }
])

puts "Users created:"

users.each do |user|
  puts "ID: #{user.id} | Email: #{user.email} | Persisted: #{user.persisted?}"
end

# ============================================================
# DEALERS
# ============================================================

puts
puts "========================================"
puts "CREATING DEALERS"
puts "========================================"

dealers = Dealer.create!([
  {
    name: "ABC Motors"
  },
  {
    name: "XYZ Automobiles"
  },
  {
    name: "Prime Dealers"
  }
])

dealers.each do |dealer|
  puts "Dealer: #{dealer.id} - #{dealer.name}"
end

# ============================================================
# VENDORS
# ============================================================

puts
puts "========================================"
puts "CREATING VENDORS"
puts "========================================"

vendors = Vendor.create!([
  {
    name: "Toyota"
  },
  {
    name: "Honda"
  },
  {
    name: "Hyundai"
  },
  {
    name: "Tata Motors"
  }
])

vendors.each do |vendor|
  puts "Vendor: #{vendor.id} - #{vendor.name}"
end

# ============================================================
# VENDOR CONTACTS
# ============================================================

puts
puts "========================================"
puts "CREATING VENDOR CONTACTS"
puts "========================================"

vendor_contacts = VendorContact.create!([
  {
    name: "Rajesh Vendor Contact",
    user_id: users[0].id
  },
  {
    name: "John Vendor Contact",
    user_id: users[1].id
  },
  {
    name: "Smith Vendor Contact",
    user_id: users[2].id
  },
  {
    name: "Admin Vendor Contact",
    user_id: users[3].id
  }
])

vendor_contacts.each do |contact|
  puts "Vendor Contact: #{contact.id} - #{contact.name} - User ID: #{contact.user_id}"
end

# ============================================================
# DEALER TO VENDORS
# ============================================================

puts
puts "========================================"
puts "CREATING DEALER TO VENDOR RELATIONSHIPS"
puts "========================================"

dealer_to_vendors = DealerToVendor.create!([
  {
    dealer_id: dealers[0].id,
    vendor_id: vendors[0].id,
    vendor_contact_id: vendor_contacts[0].id,
    vendor_dealer_id: "TOY-DEALER-001"
  },
  {
    dealer_id: dealers[0].id,
    vendor_id: vendors[1].id,
    vendor_contact_id: vendor_contacts[1].id,
    vendor_dealer_id: "HON-DEALER-001"
  },
  {
    dealer_id: dealers[1].id,
    vendor_id: vendors[2].id,
    vendor_contact_id: vendor_contacts[2].id,
    vendor_dealer_id: "HYU-DEALER-001"
  },
  {
    dealer_id: dealers[1].id,
    vendor_id: vendors[3].id,
    vendor_contact_id: vendor_contacts[3].id,
    vendor_dealer_id: "TAT-DEALER-001"
  },
  {
    dealer_id: dealers[2].id,
    vendor_id: vendors[0].id,
    vendor_contact_id: vendor_contacts[0].id,
    vendor_dealer_id: "TOY-DEALER-002"
  },
  {
    dealer_id: dealers[2].id,
    vendor_id: vendors[2].id,
    vendor_contact_id: vendor_contacts[2].id,
    vendor_dealer_id: "HYU-DEALER-002"
  }
])

puts "Dealer/Vendor relationships created: #{dealer_to_vendors.count}"

# ============================================================
# ROLES
# ============================================================

puts
puts "========================================"
puts "CREATING ROLES"
puts "========================================"

roles = Role.create!([
  {
    name: "Admin"
  },
  {
    name: "Manager"
  },
  {
    name: "Dealer User"
  },
  {
    name: "Vendor User"
  }
])

roles.each do |role|
  puts "Role: #{role.id} - #{role.name}"
end

# ============================================================
# PERMISSIONS
# ============================================================

puts
puts "========================================"
puts "CREATING PERMISSIONS"
puts "========================================"

permissions = Permission.create!([
  {
    menu: "Users",
    sub_menu: "Users",
    task: "Create"
  },
  {
    menu: "Users",
    sub_menu: "Users",
    task: "View"
  },
  {
    menu: "Users",
    sub_menu: "Users",
    task: "Edit"
  },
  {
    menu: "Users",
    sub_menu: "Users",
    task: "Delete"
  },

  {
    menu: "Dealers",
    sub_menu: "Dealers",
    task: "Create"
  },
  {
    menu: "Dealers",
    sub_menu: "Dealers",
    task: "View"
  },
  {
    menu: "Dealers",
    sub_menu: "Dealers",
    task: "Edit"
  },
  {
    menu: "Dealers",
    sub_menu: "Dealers",
    task: "Delete"
  },

  {
    menu: "Vendors",
    sub_menu: "Vendors",
    task: "Create"
  },
  {
    menu: "Vendors",
    sub_menu: "Vendors",
    task: "View"
  },
  {
    menu: "Vendors",
    sub_menu: "Vendors",
    task: "Edit"
  },
  {
    menu: "Vendors",
    sub_menu: "Vendors",
    task: "Delete"
  },

  {
    menu: "Permissions",
    sub_menu: "Permissions",
    task: "Create"
  },
  {
    menu: "Permissions",
    sub_menu: "Permissions",
    task: "View"
  },
  {
    menu: "Permissions",
    sub_menu: "Permissions",
    task: "Edit"
  },
  {
    menu: "Permissions",
    sub_menu: "Permissions",
    task: "Delete"
  }
])

permissions.each do |permission|
  puts "Permission: #{permission.id} - #{permission.menu} - #{permission.task}"
end

# ============================================================
# ROLE TO PERMISSIONS
# ============================================================

puts
puts "========================================"
puts "CREATING ROLE PERMISSIONS"
puts "========================================"

# ------------------------------------------------------------
# ADMIN
# Admin gets every permission
# ------------------------------------------------------------

permissions.each do |permission|
  RolesToPermission.create!(
    role_id: roles[0].id,
    permission_id: permission.id
  )
end

# ------------------------------------------------------------
# MANAGER
# Manager gets View and Edit permissions
# ------------------------------------------------------------

permissions
  .select { |permission| ["View", "Edit"].include?(permission.task) }
  .each do |permission|

    RolesToPermission.create!(
      role_id: roles[1].id,
      permission_id: permission.id
    )
  end

# ------------------------------------------------------------
# DEALER USER
# Dealer User gets Dealer permissions
# ------------------------------------------------------------

permissions
  .select { |permission| permission.menu == "Dealers" }
  .each do |permission|

    RolesToPermission.create!(
      role_id: roles[2].id,
      permission_id: permission.id
    )
  end

# ------------------------------------------------------------
# VENDOR USER
# Vendor User gets Vendor permissions
# ------------------------------------------------------------

permissions
  .select { |permission| permission.menu == "Vendors" }
  .each do |permission|

    RolesToPermission.create!(
      role_id: roles[3].id,
      permission_id: permission.id
    )
  end

# ============================================================
# SUMMARY
# ============================================================

puts
puts "========================================"
puts "SEED COMPLETED SUCCESSFULLY"
puts "========================================"

puts "Users:              #{User.count}"
puts "Dealers:            #{Dealer.count}"
puts "Vendors:            #{Vendor.count}"
puts "Vendor Contacts:    #{VendorContact.count}"
puts "Dealer To Vendors:  #{DealerToVendor.count}"
puts "Roles:              #{Role.count}"
puts "Permissions:        #{Permission.count}"
puts "Role Permissions:   #{RolesToPermission.count}"

puts "========================================"
