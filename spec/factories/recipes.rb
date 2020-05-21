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


FactoryBot.define do
  factory :recipe do
    name { Faker::Name.unique.name }
    base { 'MyString' }
    cook_time { 1 }
    servings { 1 }
    meal
    cuisine
    user
  end
end
