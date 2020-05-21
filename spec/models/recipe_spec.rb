# frozen_string_literal: true

# == Schema Information
#
# Table name: recipes
#
#  id         :bigint           not null, primary key
#  base       :string           not null
#  cook_time  :string           default("short")
#  name       :string           not null
#  servings   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cuisine_id :bigint           not null
#  meal_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_recipes_on_cuisine_id  (cuisine_id)
#  index_recipes_on_meal_id     (meal_id)
#  index_recipes_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cuisine_id => cuisines.id)
#  fk_rails_...  (meal_id => meals.id)
#  fk_rails_...  (user_id => users.id)
#


require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject(:recipe) { create(:recipe) }

  describe 'associations' do
    it { is_expected.to belong_to(:meal) }
    it { is_expected.to belong_to(:cuisine) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:user_recipes) }
    it { is_expected.to have_many(:users).through(:user_recipes) }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(recipe).to be_valid
    end

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(120) }
    it { is_expected.to validate_presence_of(:cook_time) }
    it { is_expected.to validate_presence_of(:servings) }
    it { is_expected.to validate_inclusion_of(:servings).in_range(1..10) }
  end

  describe '#leftovers' do
    context 'when user servings needed exceeds servings' do
      it 'returns 0' do
        expect(recipe.leftovers(10)).to eq 0
      end
    end

    context 'when user servings needed is less than or equal to servings' do
      it 'returns difference of servings and servings needed' do
        expect(recipe.leftovers(1)).to eq 0
      end
    end
  end

  describe '#favorite' do
    context 'when user has favorited recipe' do
      it 'returns true' do
        test_user = create(:user) do |user|
          user.user_recipes.create(user: user, recipe: recipe, is_favorite: true)
        end
        expect(recipe.favorite(test_user)).to eq true
      end
    end

    context 'when user has not favorited recipe' do
      it 'returns false' do
        expect(recipe.favorite(recipe.user)).to eq false
      end
    end
  end

  describe '#kid_friendly' do
    context 'when user has marked recipe as kid friendly' do
      it 'returns true' do
        test_user = create(:user) do |user|
          user.user_recipes.create(user: user, recipe: recipe, is_kid_friendly: true)
        end
        expect(recipe.kid_friendly(test_user)).to eq true
      end
    end

    context 'when user has not marked recipe as kid friendly' do
      it 'returns false' do
        expect(recipe.kid_friendly(recipe.user)).to eq false
      end
    end
  end

  describe '#favorite_mod' do
    context 'when recipe is favorite' do
      it 'returns modifier' do
        test_user = create(:user) do |user|
          user.user_recipes.create(user: user, recipe: recipe, is_favorite: true)
        end
        expect(recipe.favorite_mod(recipe.favorite(test_user))).to be > 0
      end
    end

    context 'when recipe is not favorite' do
      it 'return no modifier' do
        expect(recipe.favorite_mod(recipe.favorite(recipe.user))).to eq 0
      end
    end
  end

  describe '#kid_friendly_mod' do
    context 'when recipe is kid friendly' do
      it 'returns modifier' do
        test_user = create(:user) do |user|
          user.user_recipes.create(user: user, recipe: recipe, is_kid_friendly: true)
        end
        expect(recipe.kid_friendly_mod(recipe.kid_friendly(test_user))).to be > 0
      end
    end

    context 'when recipe is not kid friendly' do
      it 'returns no modifier' do
        expect(recipe.kid_friendly_mod(recipe.kid_friendly(recipe.user))).to eq 0
      end
    end
  end

  describe '#base_mod' do
    context 'when previous meal is same base' do
      it 'returns no modifier' do
        expect(recipe.base_mod(recipe.meal.name)).to eq 0
      end
    end

    context 'when previous meal is different base' do
      it 'returns a modifier' do
        expect(recipe.base_mod('test')).to be > 0
      end
    end
  end
end
