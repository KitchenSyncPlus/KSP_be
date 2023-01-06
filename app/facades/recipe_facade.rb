class RecipeFacade
  def self.recipes
    data = RecipeFacade.recipes
    recipe_results = data[:hits]
    recipe_results.each do |recipe|
      ingredients_list = recipe[:recipe][:ingredients]
      ingredients_array = ingredients_list.map do |i|
        i[:food]
      end
      ingredients_string = ingredients_array.join ", "
      Recipe.create!(ingredients: ingredients_string, source: recipe[:recipe][:source], url: recipe[:recipe][:url])
    end
  end
end
