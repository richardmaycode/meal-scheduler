require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject { create(:recipe) }
  context 'associations' do
    it { should belong_to(:meal) }
    it { should belong_to(:cuisine) }  
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
end
