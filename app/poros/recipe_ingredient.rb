class RecipeIngredient
  attr_reader :text,
              :quantity,
              :measure,
              :food,
              :weight,
              :foodCategory,
              :foodId,
              :image

  def initialize(data)
    @text = data[:text]
    @quantity = data[:quantity]
    @measure = data[:measure]
    @food = data[:food]
    @weight = data[:weight]
    @foodCategory = data[:foodCategory]
    @foodId = data[:foodId]
    @image = data[:image]
  end
end