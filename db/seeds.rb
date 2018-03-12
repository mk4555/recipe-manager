# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(email: "mk4555@nyu.edu", password: "123456")
ribeye = Ingredient.create!(name: "Ribeye")
duck = Ingredient.create!(name: "Duck")
broccoli = Ingredient.create!(name: "Broccoli")
potatoes = Ingredient.create!(name: "Potatoes")
onions = Ingredient.create!(name: "Onions")
white_rice = Ingredient.create!(name: "White Rice")
recipe1 = Recipe.create!(name: "Steak Dinner", rating: 4, cook_time: 20, description: "Steak dinner with bunch of vegetables and ribeye", user_id: user.id)
recipe1.ingredients << ribeye
recipe1.ingredients << potatoes
recipe1.ingredients << broccoli
recipe1.ingredients << onions
recipe2 = Recipe.create!(name: "Potato Dinner", rating: 3, cook_time: 15, description: "Just a potato with gravy, nothin else", user_id: user.id)
recipe2.ingredients << potatoes
recipe2.ingredients << white_rice
