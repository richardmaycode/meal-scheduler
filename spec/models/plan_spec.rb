# frozen_string_literal: true

# == Schema Information
#
# Table name: plans
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  day_id     :bigint           not null
#  meal_id    :bigint           not null
#  recipe_id  :bigint
#  user_id    :bigint           not null
#
# Indexes
#
#  index_plans_on_day_id     (day_id)
#  index_plans_on_meal_id    (meal_id)
#  index_plans_on_recipe_id  (recipe_id)
#  index_plans_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (day_id => days.id)
#  fk_rails_...  (meal_id => meals.id)
#  fk_rails_...  (recipe_id => recipes.id)
#  fk_rails_...  (user_id => users.id)
#


require 'rails_helper'

RSpec.describe Plan, type: :model do
  subject(:plan) { create(:plan) }
  describe 'associations' do
    it { is_expected.to belong_to(:meal) }
    it { is_expected.to belong_to(:recipe).optional }
    it { is_expected.to belong_to(:day) }
    it { is_expected.to belong_to(:user) }
  end

  describe '#scheduled' do
    it 'gets scheduled from the associated day' do
      expect(plan.scheduled).to eq plan.day.scheduled  
    end
  end
end
