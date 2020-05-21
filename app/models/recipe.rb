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

  def base_mod(previous_recipe_meal)
    return 0 unless meal.name != previous_recipe_meal

    500
  end
end
