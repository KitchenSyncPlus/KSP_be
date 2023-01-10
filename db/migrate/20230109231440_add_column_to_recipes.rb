class AddColumnToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipes, :group, foreign_key: true
  end
end
