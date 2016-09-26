# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# r1 = Role.create(name: "super admin")
# r2 = Role.create(name: "admin")
# r3 = Role.create(name: "user")

# user1 = User.create(name: "Super Admin", email: "superadmin@mail.com", password: "timesecret", role_id: r1.id)
# user2 = User.create(name: "Admin", email: "admin@mail.com", password: "timesecret", role_id: r2.id)
# user3 = User.create(name: "User1", email: "user1@mail.com", password: "timesecret", role_id: r3.id)


r1 = Role.create(name: "super admin")  if Role.find_by(name: 'super admin').nil?
Role.create(name: "admin")  if Role.find_by(name: 'admin').nil?
Role.create(name: "user")  if Role.find_by(name: 'user').nil?

if User.find_by(email: 'superadmin@mail.com').nil?
  User.create(name: "Super Admin", email: "superadmin@mail.com", password: "timesecret", role_id: r1.id)
end