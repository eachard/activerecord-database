class CreateRecipes < ActiveRecord::Migration
  
  def up 
    create_table :recipes do |t|
      t.string  :name
      t.text  :description
      t.integer :rating
      t.integer :length
    end
  end
end