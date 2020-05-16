require 'rails_helper'

RSpec.describe Day, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:day_meals) }
    it { should have_many(:meals).through(:day_meals) }
    it { should have_many(:plans) }
    it { should have_many(:recipes).through(:plans) }
  end

  describe 'validations' do
    it { should validate_presence_of(:scheduled) }
  end
end
