require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RecipesHelper. For example:
#
# describe RecipesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe RecipesHelper, type: :helper do
  describe '#recipes_cook_times_for_select' do
    it 'returns a hash of cook times' do
      expect(recipes_cook_times_for_select).to eq ENUMS::RECIPE_COOK_TIMES.values.map { |val| [val.humanize, val] }
    end
  end
  describe '#recipes_meals_for_select' do
    it 'returns a hash of meals'do
      expect(recipes_meals_for_select).to eq Meal.all.map { |m| [m.name, m.id] }
    end
  end
  describe '#recipes_cuisines_for_select' do
    it 'should return a hash of cuisines' do
      expect(recipes_cuisines_for_select).to eq Cuisine.all.map { |c| [c.name, c.id] }
    end
  end
end

