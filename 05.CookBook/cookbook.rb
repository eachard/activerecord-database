require 'pry'

require_relative 'config/application'
require './models/recipe'

# your program here

puts "Salut Robuchon, what do you want to do today?"
puts "1. create a recipe"
puts "2. delete all recipes"
puts "3. read your recipes"

choice = gets.chomp.to_i
if choice == 1
  puts "name?"
  name = gets.chomp
  puts "description?"
  description = gets.chomp
  puts "length?"
  length = gets.chomp.to_i
  puts "difficulty?"
  difficulty = gets.chomp.to_i
	# AR  
	Recipe.create(name: name, description: description, length: length, difficulty: difficulty)
elsif choice == 2
	recipe = Recipe.find_by(name: name, description: description, length: length, difficulty: difficulty)
  recipe.destroy if recipe
elsif choice == 3
  puts "Here are all your recipes!!!!!"
  Recipe.all
else
	puts "catch all"
end 