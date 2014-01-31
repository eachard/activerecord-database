class CreateRecipes < ActiveRecord::Migration
  
  def up 
    create_table :recipes do |t|
      t.string  :name
      t.text  :description
      t.integer :difficulty
      t.integer :length
    end
  end
end