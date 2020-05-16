require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject { create(:recipe) }
  context 'associations' do
    it { should belong_to(:meal) }
    it { should belong_to(:cuisine) }
    it { should belong_to(:user) }
    it { should have_many(:user_recipes) }
    it { should have_many(:users).through(:user_recipes) }
  end
  context 'validations' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(5).is_at_most(60) }
    it { should validate_presence_of(:cook_time) }
    it { should validate_presence_of(:servings) }
    it { should validate_inclusion_of(:servings).in_range(1..10) }
  end
  describe 'methods' do
    describe '#leftovers' do
      context 'when user servings needed exceeds servings' do
        it 'returns 0' do
          expect(subject.leftovers(10)).to eq 0
        end
      end
      context 'when user servings needed is less than or equal to servings' do
        it 'returns difference of servings and servings needed' do
          expect(subject.leftovers(1)).to eq 0
        end
      end
    end
    describe '#favorite' do
      context 'when user has favorited recipe' do
        it 'returns true' do
          test_user = create(:user) do |user|
            user.user_recipes.create(user: user, recipe: subject, is_favorite: true)
          end
          expect(subject.favorite(test_user)).to eq true
        end
      end
      context 'when user has not favorited recipe' do
        it 'returns false' do
          expect(subject.favorite(subject.user)).to eq false
        end
      end
    end
    describe '#kid_friendly' do
      context 'when user has marked recipe as kid friendly' do
        it 'returns true' do
          test_user = create(:user) do |user|
            user.user_recipes.create(user: user, recipe: subject, is_kid_friendly: true)
          end
          expect(subject.kid_friendly(test_user)).to eq true
        end
      end
      context 'when user has not marked recipe as kid friendly' do
        it 'returns false' do
          expect(subject.kid_friendly(subject.user)).to eq false
        end
      end
    end
  end
end
