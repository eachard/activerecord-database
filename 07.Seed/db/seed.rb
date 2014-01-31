require './models/recipe'
require 'nokogiri'
require 'open-uri'
# Seed you database with recipe data from marmiton

puts "Seeding database..."

# Here is a sample of ingredients (you are free to add some !)
ingredients = ["curry", "crevettes", "agneau", "pomme", "orange", "cafe", "asperges", "celeri", "dorade"]

    ingredients.each do | ingredient|
      doc = Nokogiri::HTML(open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{ingredient}"))

      doc.search('.m_search_result').each do |element|
       name = element.search('.m_search_titre_recette > a').inner_text
       description = element.search('.m_search_result_part4').inner_text.strip
       length = description.match(/(\d+)/)[0].to_i
       rating = element.search('.etoile1').size

       Recipe.create({name: name, description: description, rating: rating, length: length})

      end
    end
    
