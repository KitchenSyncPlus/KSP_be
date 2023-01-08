class RecipeIngredient
  attr_reader :quantity,
              :measure,
              :food,
              :weight

  def initialize(data)
    @quantity = data[:quantity]
    @measure = data[:measure]
    @food = data[:food]
    @weight = data[:weight]
  end
end