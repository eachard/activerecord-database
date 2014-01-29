class AddRatingToRecipes < ActiveRecord::Migration

  def up
    add_column :recipes, :rating, :integer
  end

end