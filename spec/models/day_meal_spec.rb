# frozen_string_literal: true

# == Schema Information
#
# Table name: day_meals
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  day_id     :bigint           not null
#  meal_id    :bigint           not null
#
# Indexes
#
#  index_day_meals_on_day_id   (day_id)
#  index_day_meals_on_meal_id  (meal_id)
#
# Foreign Keys
#
#  fk_rails_...  (day_id => days.id)
#  fk_rails_...  (meal_id => meals.id)
#


require 'rails_helper'

RSpec.describe DayMeal, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:day) }
    it { is_expected.to belong_to(:meal) }
  end
end
