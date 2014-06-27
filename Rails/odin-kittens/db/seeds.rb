# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Kitten.delete_all
Kitten.create(name: "jack", age: "100", cuteness: "5", softness: "5")
Kitten.create(name: "johnson", age: "1", cuteness: "1", softness: "1")
Kitten.create(name: "banana", age: "5", cuteness: "5", softness: "5")
Kitten.create(name: "pancakes", age: "1", cuteness: "1", softness: "1")