require 'rails_helper'

RSpec.describe Meal, type: :model do
  subject {create(:meal)}
  context 'associations' do
    it { should define_enum_for(:status) }
  end
  context 'validations' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of(:name).is_at_least(5).is_at_most(15) }
    it { should validate_presence_of(:status) }
  end
end
