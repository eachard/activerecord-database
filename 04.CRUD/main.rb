require 'sqlite3'

# creates the database
db_path = "db/cookbook.sqlite"
db = SQLite3::Database.new(db_path)

# creates the schema of the database
# your code here
	sql = "CREATE TABLE IF NOT EXISTS Recipes (Id integer PRIMARY KEY AUTOINCREMENT,Name varchar(255) NOT NULL,Description varchar(255),length integer,Difficulty integer)"
begin
	db.execute(sql)
	p "Welcome!"
rescue
	puts "You again, Welcome back"
end

#*************************************

# function to create a recipe
def create_recipe(db,name,description,length,difficulty)
  db.execute("INSERT INTO Recipes (Name, Description, Length, Difficulty)
  VALUES ('#{name}','#{description}','#{length}','#{difficulty}')
  	;")
end

# function to delete a recipe
def delete_recipe(db,id)
	sql = "DELETE FROM Recipes WHERE Id = '#{id}'"
	db.execute(sql)
end

# function to delete all recipes
def delete_all_recipes(db)
 sql = "DELETE FROM Recipes"
 db.execute(sql)
end

# function to update a recipe
def update_recipe(db,id,description)
	sql = ("UPDATE Recipe SET description='#{description}'WHERE name='#{id}'")
	db.execute(sql)
end

# function to get all recipes
def get_recipes(db)
  sql = "SELECT * FROM Recipes"
  db.execute(sql)
end


#*************************************

# program

puts "Salut Robuchon, what do you want to do today?"
puts "1. create a recipe"
puts "2. delete all recipes"
puts "3. read your recipes"
puts "4. Exit"

choice =  gets.chomp.to_i

if choice == 1
  puts "name?"
  name = gets.chomp
  puts "description?"
  description = gets.chomp
  puts "length?"
  length = gets.chomp.to_i
  puts "difficulty?"
  difficulty = gets.chomp.to_i

  create_recipe(db,name,description,length,difficulty)
  
elsif choice == 2
		puts "delete all recipes (1) or one recipe (2) or update(3)?"
		choice = gets.chomp.to_i
  case choice
  when 1
    puts "you just deleted all your recipes!"
    id = gets.chomp.to_i
    delete_all_recipes(db)
  when 2
  	delete_recipe(db,id)
  	puts "What recipe ?"
  	id = gets.chomp.to_i
  when 3
  	update_recipe(db,id,description)

  end
elsif choice == 2
  puts "what recipe?"
  id = gets.chomp.to_i
  delete_recipe(db,id)
elsif choice == 3
  puts "Here are all your recipes!!!!!"
  puts get_recipes(db)
elsif choice == 3
	get_recipes(db)
elsif choice == 4
	puts "Bye"
else
	puts "catch all"
end 