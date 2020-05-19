# frozen_string_literal: true

class User < ApplicationRecord
  # associations
  has_many :user_recipes, dependent: :destroy
  has_many :favorite_user_recipes, -> { where(is_favorite: true) }, class_name: "UserRecipe"
  has_many :kid_friendly_user_recipes, -> { where(is_kid_friendly: true) }, class_name: "UserRecipe"
  has_many :recipes, through: :user_recipes
  has_many :favorite_recipes, through: :favorite_user_recipes, source: :recipe
  has_many :kid_friendly_recipes, through: :kid_friendly_user_recipes, source: :recipe

  # validations
  validates :username, presence: true, uniqueness: true, length: { minimum: 5, maximum: 60 }
  validates :name, presence: true, length: { minimum: 5, maximum: 30 }
  validates :default_servings, presence: true, inclusion: { in: 1..5 }
end
