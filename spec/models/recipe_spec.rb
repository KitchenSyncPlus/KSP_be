require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'a single instance of a recipe' do
    it 'exists' do
      group = create(:group)
      recipe_1 = create(:recipe, group_id: group.id)

      expect(recipe_1).to be_a Recipe
      expect(recipe_1.group_id).to eq(group.id)
    end
  end

  describe 'associations' do
    it { should belong_to(:group) }
    it { should have_many(:recipe_ingredients) }
  end
end
