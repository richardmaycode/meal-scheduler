# frozen_string_literal: true

# == Schema Information
#
# Table name: plans
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  day_id     :bigint           not null
#  recipe_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_plans_on_day_id     (day_id)
#  index_plans_on_recipe_id  (recipe_id)
#  index_plans_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (day_id => days.id)
#  fk_rails_...  (recipe_id => recipes.id)
#  fk_rails_...  (user_id => users.id)
#


class Plan < ApplicationRecord
  belongs_to :recipe
  belongs_to :day
  belongs_to :user

  def scheduled
    day.scheduled
  end

  def meal
    recipe.meal.name
  end
end
