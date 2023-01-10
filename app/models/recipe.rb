class Recipe < ApplicationRecord
  belongs_to :group

  has_many :recipe_ingredients
end
