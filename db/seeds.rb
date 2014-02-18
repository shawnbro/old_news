# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

contact = Contact.create(first_name: "Steve", last_name: "Broukhim", email: "sbroukhim@gmail.com", user_id: User.find_by(first_name: "Shawn").id)