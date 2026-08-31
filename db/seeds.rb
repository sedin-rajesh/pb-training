# db/seeds.rb

puts "========================================"
puts "CLEARING EXISTING DATA"
puts "========================================"

RolesToPermission.delete_all
DealerToVendor.delete_all
DealerVendorContact.delete_all
VendorContact.delete_all
Permission.delete_all
Role.delete_all
Dealer.delete_all
User.delete_all
Vendor.delete_all

puts "Existing data cleared."

# ============================================================
# VENDORS
# ============================================================

puts
puts "========================================"
puts "CREATING VENDORS"
puts "========================================"

vendors = Vendor.create!([
  { name: "Toyota" },
  { name: "Honda" },
  { name: "Hyundai" },
  { name: "Tata Motors" },
  { name: "Mahindra" }
])

vendors.each do |vendor|
  puts "Vendor: #{vendor.id} - #{vendor.name}"
end

# ============================================================
# USERS
# Each user belongs to ONLY ONE vendor
# ============================================================

puts
puts "========================================"
puts "CREATING USERS"
puts "========================================"

users = User.create!([
  # -------------------------
  # Toyota users
  # -------------------------
  {
    user_name: "rajesh",
    firstname: "Rajesh",
    lastname: "S",
    email: "rajesh@example.com",
    password: "Password@123",
    vendor_id: vendors[0].id
  },
  {
    user_name: "arun",
    firstname: "Arun",
    lastname: "Kumar",
    email: "arun@example.com",
    password: "Password@123",
    vendor_id: vendors[0].id
  },
  {
    user_name: "priya",
    firstname: "Priya",
    lastname: "Sharma",
    email: "priya@example.com",
    password: "Password@123",
    vendor_id: vendors[0].id
  },

  # -------------------------
  # Honda users
  # -------------------------
  {
    user_name: "john",
    firstname: "John",
    lastname: "Doe",
    email: "john@example.com",
    password: "Password@123",
    vendor_id: vendors[1].id
  },
  {
    user_name: "kiran",
    firstname: "Kiran",
    lastname: "Reddy",
    email: "kiran@example.com",
    password: "Password@123",
    vendor_id: vendors[1].id
  },
  {
    user_name: "anil",
    firstname: "Anil",
    lastname: "Patel",
    email: "anil@example.com",
    password: "Password@123",
    vendor_id: vendors[1].id
  },

  # -------------------------
  # Hyundai users
  # -------------------------
  {
    user_name: "smith",
    firstname: "Smith",
    lastname: "Kumar",
    email: "smith@example.com",
    password: "Password@123",
    vendor_id: vendors[2].id
  },
  {
    user_name: "suresh",
    firstname: "Suresh",
    lastname: "Rao",
    email: "suresh@example.com",
    password: "Password@123",
    vendor_id: vendors[2].id
  },

  # -------------------------
  # Tata users
  # -------------------------
  {
    user_name: "admin",
    firstname: "Admin",
    lastname: "User",
    email: "admin@example.com",
    password: "Password@123",
    vendor_id: vendors[3].id
  },
  {
    user_name: "meena",
    firstname: "Meena",
    lastname: "Reddy",
    email: "meena@example.com",
    password: "Password@123",
    vendor_id: vendors[3].id
  },

  # -------------------------
  # Mahindra users
  # -------------------------
  {
    user_name: "vikram",
    firstname: "Vikram",
    lastname: "Singh",
    email: "vikram@example.com",
    password: "Password@123",
    vendor_id: vendors[4].id
  },
  {
    user_name: "deepak",
    firstname: "Deepak",
    lastname: "Verma",
    email: "deepak@example.com",
    password: "Password@123",
    vendor_id: vendors[4].id
  }
])

users.each do |user|
  puts "User: #{user.id} - #{user.user_name} - #{user.email} - Vendor: #{user.vendor.name}"
end

# ============================================================
# DEALERS
# ============================================================

puts
puts "========================================"
puts "CREATING DEALERS"
puts "========================================"

dealers = Dealer.create!([
  { name: "ABC Motors" },
  { name: "XYZ Automobiles" },
  { name: "Prime Dealers" },
  { name: "City Motors" },
  { name: "Global Automobiles" }
])

dealers.each do |dealer|
  puts "Dealer: #{dealer.id} - #{dealer.name}"
end

# ============================================================
# VENDOR CONTACTS
# Each contact belongs to one user
# ============================================================

puts
puts "========================================"
puts "CREATING VENDOR CONTACTS"
puts "========================================"

vendor_contacts = VendorContact.create!([
  {
    name: "Rajesh Contact",
    user_id: users[0].id
  },
  {
    name: "Arun Contact",
    user_id: users[1].id
  },
  {
    name: "Priya Contact",
    user_id: users[2].id
  },
  {
    name: "John Contact",
    user_id: users[3].id
  },
  {
    name: "Kiran Contact",
    user_id: users[4].id
  },
  {
    name: "Anil Contact",
    user_id: users[5].id
  },
  {
    name: "Smith Contact",
    user_id: users[6].id
  },
  {
    name: "Suresh Contact",
    user_id: users[7].id
  },
  {
    name: "Admin Contact",
    user_id: users[8].id
  },
  {
    name: "Meena Contact",
    user_id: users[9].id
  },
  {
    name: "Vikram Contact",
    user_id: users[10].id
  },
  {
    name: "Deepak Contact",
    user_id: users[11].id
  }
])

vendor_contacts.each do |contact|
  puts "Vendor Contact: #{contact.id} - #{contact.name}"
end

# ============================================================
# DEALER TO VENDOR
# Dealer <-> Vendor relationship
# ============================================================

puts
puts "========================================"
puts "CREATING DEALER/VENDOR RELATIONSHIPS"
puts "========================================"

dealer_to_vendors = DealerToVendor.create!([
  # Toyota
  {
    dealer_id: dealers[0].id,
    vendor_id: vendors[0].id,
    vendor_contact_id: vendor_contacts[0].id,
    vendor_dealer_id: "TOY-DEALER-001"
  },
  {
    dealer_id: dealers[1].id,
    vendor_id: vendors[0].id,
    vendor_contact_id: vendor_contacts[1].id,
    vendor_dealer_id: "TOY-DEALER-002"
  },
  {
    dealer_id: dealers[2].id,
    vendor_id: vendors[0].id,
    vendor_contact_id: vendor_contacts[2].id,
    vendor_dealer_id: "TOY-DEALER-003"
  },

  # Honda
  {
    dealer_id: dealers[0].id,
    vendor_id: vendors[1].id,
    vendor_contact_id: vendor_contacts[3].id,
    vendor_dealer_id: "HON-DEALER-001"
  },
  {
    dealer_id: dealers[1].id,
    vendor_id: vendors[1].id,
    vendor_contact_id: vendor_contacts[4].id,
    vendor_dealer_id: "HON-DEALER-002"
  },
  {
    dealer_id: dealers[2].id,
    vendor_id: vendors[1].id,
    vendor_contact_id: vendor_contacts[5].id,
    vendor_dealer_id: "HON-DEALER-003"
  },

  # Hyundai
  {
    dealer_id: dealers[1].id,
    vendor_id: vendors[2].id,
    vendor_contact_id: vendor_contacts[6].id,
    vendor_dealer_id: "HYU-DEALER-001"
  },
  {
    dealer_id: dealers[2].id,
    vendor_id: vendors[2].id,
    vendor_contact_id: vendor_contacts[7].id,
    vendor_dealer_id: "HYU-DEALER-002"
  },

  # Tata Motors
  {
    dealer_id: dealers[0].id,
    vendor_id: vendors[3].id,
    vendor_contact_id: vendor_contacts[8].id,
    vendor_dealer_id: "TAT-DEALER-001"
  },
  {
    dealer_id: dealers[3].id,
    vendor_id: vendors[3].id,
    vendor_contact_id: vendor_contacts[9].id,
    vendor_dealer_id: "TAT-DEALER-002"
  },

  # Mahindra
  {
    dealer_id: dealers[2].id,
    vendor_id: vendors[4].id,
    vendor_contact_id: vendor_contacts[10].id,
    vendor_dealer_id: "MAH-DEALER-001"
  },
  {
    dealer_id: dealers[4].id,
    vendor_id: vendors[4].id,
    vendor_contact_id: vendor_contacts[11].id,
    vendor_dealer_id: "MAH-DEALER-002"
  }
])

puts "Dealer/Vendor relationships: #{dealer_to_vendors.count}"

# ============================================================
# ROLES
# ============================================================

puts
puts "========================================"
puts "CREATING ROLES"
puts "========================================"

roles = Role.create!([
  { name: "Admin" },
  { name: "Manager" },
  { name: "Dealer User" },
  { name: "Vendor User" }
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
  # Users
  { menu: "Users", sub_menu: "Users", task: "Create" },
  { menu: "Users", sub_menu: "Users", task: "View" },
  { menu: "Users", sub_menu: "Users", task: "Edit" },
  { menu: "Users", sub_menu: "Users", task: "Delete" },

  # Dealers
  { menu: "Dealers", sub_menu: "Dealers", task: "Create" },
  { menu: "Dealers", sub_menu: "Dealers", task: "View" },
  { menu: "Dealers", sub_menu: "Dealers", task: "Edit" },
  { menu: "Dealers", sub_menu: "Dealers", task: "Delete" },

  # Vendors
  { menu: "Vendors", sub_menu: "Vendors", task: "Create" },
  { menu: "Vendors", sub_menu: "Vendors", task: "View" },
  { menu: "Vendors", sub_menu: "Vendors", task: "Edit" },
  { menu: "Vendors", sub_menu: "Vendors", task: "Delete" },

  # Permissions
  { menu: "Permissions", sub_menu: "Permissions", task: "Create" },
  { menu: "Permissions", sub_menu: "Permissions", task: "View" },
  { menu: "Permissions", sub_menu: "Permissions", task: "Edit" },
  { menu: "Permissions", sub_menu: "Permissions", task: "Delete" }
])

# ============================================================
# ROLE PERMISSIONS
# ============================================================

puts
puts "========================================"
puts "CREATING ROLE PERMISSIONS"
puts "========================================"

# Admin → all permissions

permissions.each do |permission|
  RolesToPermission.create!(
    role_id: roles[0].id,
    permission_id: permission.id
  )
end

# Manager → View + Edit

permissions
  .select { |permission| ["View", "Edit"].include?(permission.task) }
  .each do |permission|

  RolesToPermission.create!(
    role_id: roles[1].id,
    permission_id: permission.id
  )
end

# Dealer User → Dealer permissions

permissions
  .select { |permission| permission.menu == "Dealers" }
  .each do |permission|

  RolesToPermission.create!(
    role_id: roles[2].id,
    permission_id: permission.id
  )
end

# Vendor User → Vendor permissions

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

puts
puts "========================================"
puts "VENDOR -> USERS"
puts "========================================"

Vendor.includes(:users).find_each do |vendor|
  puts
  puts "#{vendor.name}:"

  vendor.users.each do |user|
    puts "  - #{user.user_name} (#{user.email})"
  end
end

puts
puts "========================================"