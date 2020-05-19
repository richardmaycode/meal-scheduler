# frozen_string_literal: true

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
