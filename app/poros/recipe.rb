class Recipe
  attr_reader :label, 
              :uri,
              :ingredients

  def initialize(data)
    @label = data[:label]
    @uri = data[:uri]
    @ingredients = data[:ingredients]
  end
end