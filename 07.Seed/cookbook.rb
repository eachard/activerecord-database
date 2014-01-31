require 'nokogiri'
require 'open-uri'
require_relative 'config/application'
require './models/recipe'

# query the database here

# gets only the recipes with difficulty 3
ingredient = 'Curry poulet'
puts Recipe.select(:rating).where("name LIKE'%poulet%'")
# Task.find :all, :select => "name, members"


# gets the top 10 difficult recipes

#SELECT * FROM recipes WHERE name LIKE  "%poulet%"

