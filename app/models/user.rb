# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  default_servings :integer          not null
#  name             :string           not null
#  username         :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#


class User < ApplicationRecord
  # associations
  has_many :weeks
  has_many :days
  has_many :plans
  has_many :user_recipes, dependent: :destroy
  has_many :favorite_user_recipes, -> { where(is_favorite: true) }, class_name: "UserRecipe"
  has_many :kid_friendly_user_recipes, -> { where(is_kid_friendly: true) }, class_name: "UserRecipe"
  has_many :recipes, through: :user_recipes
  has_many :favorite_recipes, through: :favorite_user_recipes, source: :recipe
  has_many :kid_friendly_recipes, through: :kid_friendly_user_recipes, source: :recipe
  has_many :used_recipes, through: :plans, class_name: "Recipe"

  # validations
  validates :username, presence: true, uniqueness: true, length: { minimum: 5, maximum: 60 }
  validates :name, presence: true, length: { minimum: 5, maximum: 30 }
  validates :default_servings, presence: true, inclusion: { in: 1..5 }
end
