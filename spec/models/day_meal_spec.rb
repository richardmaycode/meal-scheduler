require 'rails_helper'

RSpec.describe DayMeal, type: :model do
  describe 'associations' do
    it { should belong_to(:day) }
    it { should belong_to(:meal) }
  end
end
