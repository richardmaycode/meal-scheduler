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


class Recipe < ApplicationRecord
  # associations
  belongs_to :meal
  belongs_to :cuisine
  belongs_to :user
  has_many :user_recipes
  has_many :users, through: :user_recipes
  # validations
  validates :name, presence: true, length: { minimum: 5, maximum: 120 }
  validates :cook_time, presence: true
  validates :servings, presence: true, inclusion: { in: 1..10 }

  # scopes

  # methods
  def leftovers(servings_needed)
    return 0 if servings_needed > servings

    servings - servings_needed
  end

  def favorite(user)
    user.favorite_recipes.exists?(id)
  end

  def kid_friendly(user)
    user.kid_friendly_recipes.exists?(id)
  end

  def favorite_mod(favorite)
    return 0 unless favorite

    50
  end

  def kid_friendly_mod(kid_friendly)
    return 0 unless kid_friendly

    50
  end

  def base_mod(last_recipe)
    if last_recipe.nil? 
      last_base = 'Beef'
    else
      last_base = last_recipe.meal.name
    end
    return 0 unless meal.name != last_base

    5000
  end

  def leftover_mod(last_recipe)
    if last_recipe.nil?
      previous_leftover = 0
    else
      previous_leftover = last_recipe.leftovers(last_recipe.user.default_servings)
    end
    return 0 unless previous_leftover > 0
    
    50
  end

  def time_mod(user, date)
    mod = 0
    last_use = user.plans.where(recipe_id: id).last
    if last_use.nil? 
      mod = 700
    else
      days = (date - last_use.scheduled).to_i
      mod = days * 50
    end

    return mod
  end
  

  # TODO need to implement meal length mod
  def sort_score(user, date)
    base = 50
    kfm = kid_friendly_mod(kid_friendly(user))
    fm = favorite_mod(favorite(user))
    bm = base_mod(user.used_recipes.last)
    lm = leftover_mod(user.used_recipes.last)
    tm = time_mod(user, date)

    score = base + kfm + fm + bm + tm
  end
end
