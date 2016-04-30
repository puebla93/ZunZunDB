# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Employee.create([{name: "Hector Quintero Travieso", gender: "M", description: "..."}])
User.create({name: "Hector Quintero Travieso", role: true, email: "hectorq@t.cu", password: "12345678"})