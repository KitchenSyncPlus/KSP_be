class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :ingredients
      t.string :label
      t.string :uri

      t.timestamps
    end
  end
end
