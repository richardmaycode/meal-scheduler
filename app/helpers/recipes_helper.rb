module RecipesHelper
  def recipes_cook_times_for_select
    ENUMS::RECIPE_COOK_TIMES.values.map { |val| [val.humanize, val] }
  end

  def recipes_meals_for_select
    Meal.all.map { |m| [m.name, m.id] }
  end

  def recipes_cuisines_for_select
    Cuisine.all.map { |c| [c.name, c.id] }
  end
  
end
