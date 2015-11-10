# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

OilType.create!([{name: "Lard"}, {name: "Coconut Oil"}])

Chip.create!([{name: "Slotachips", price: 20, description: "Super yummy", oil_type_id: 1}, {name: "Trader Joe's BBQ", price: 15, description: "I'd trade slota for these!", oil_type_id: 2}, {name: "Dang Coconut", price: 17, description: "Dang, these are good", oil_type_id: 2}, {name: "Lard Yummies", price: 19, description: "Chock Full of Lard", oil_type_id: 1}])
