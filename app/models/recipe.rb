class Recipe < ApplicationRecord
  # associations
  belongs_to :meal
  belongs_to :cuisine
  belongs_to :user
  has_many :user_recipes
  has_many :users, through: :user_recipes
  # validations
  validates :name, presence: true, length: {minimum: 5, maximum: 60}
  validates :cook_time, presence: true
  validates :servings, presence: true, inclusion: { in: 1..10 }

  # scopes

  # methods
  def leftovers(servings_needed)
    return 0 if servings_needed > servings

    servings - servings_needed
  end

  def favorite(user)
    user.favorite_recipes.exists?(self.id)
  end

  def kid_friendly(user)
    user.kid_friendly_recipes.exists?(self.id)
  end
end
