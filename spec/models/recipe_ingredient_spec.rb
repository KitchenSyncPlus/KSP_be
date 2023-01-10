require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  before(:each) do
    @user = create(:user)
    @group = create(:group)
    @recipe = create(:recipe, group_id: @group.id)
    @recipe_ingredient = create(:recipe_ingredient, user_id: @user.id, recipe_id: @recipe.id)
  end

  describe 'a single instance of a RecipeIngredient' do
    it 'exists' do
      expect(@recipe_ingredient).to be_a RecipeIngredient
    end

    it 'has @name, @quantity, @price' do
      expect(@recipe_ingredient.name).to be_a String
      expect(@recipe_ingredient.quantity).to be_a Float
      expect(@recipe_ingredient.price).to be_a Float
    end
  end

  describe 'associations' do
    it { should belong_to(:recipe) }
    it { should belong_to(:user) }
  end
end
