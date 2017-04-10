# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
role = Role.create(role_name: "admin")
user = User.create(email: "admin@gmail.com", password: "123456")
RolesUser.create(role_id: role.id, user_id: user.id)
