# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'open-uri'


url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
doc = open(url).read
list = JSON.parse(doc)

list["drinks"].each do |drink_hash|
  ingredient_name = drink_hash["strIngredient1"]
  new_ingredient = Ingredient.new(name: ingredient_name)
  puts "Ingredient #{new_ingredient.name} saved!" if new_ingredient.save
end
