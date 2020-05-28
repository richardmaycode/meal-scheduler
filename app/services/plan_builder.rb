class PlanBuilder < ApplicationService
  def initialize(user, day, meal, recipes)
    @user = user
    @day = day
    @meal = meal
    @recipes = recipes
  end

  def call
    recipe = Recipes::RecipeScorer.call(@recipes, @user, @day.scheduled)
    plan = Plan.create(day_id: @day.id, user_id: @user.id, recipe_id: recipe)
    return true if plan.save

    false
  end
end
