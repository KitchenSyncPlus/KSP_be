class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :ingredients
      t.string :source
      t.string :url

      t.timestamps
    end
  end
end
