class WeekBuilder < ApplicationService
  def initialize(week, days, user)
    @week = week
    @days = days
    @user = user
  end

  def call
    create_days
    used_recipes = []
    @week.days.each do |day|
      day.meals.each do |meal|
        recipes = @user.recipes.where(meal: meal).where.not(id: used_recipes)
        PlanBuilder.call(@user, day, meal, recipes)
        used_recipes << day.plans.last.recipe.id
      end
    end
  end

  def create_days
    @days.each do |k, v|
      v.each do |_k2, v2|
        mod = k.to_i
        day = if mod.zero?
                @week.days.create(scheduled: @week.start, user_id: @user.id)
              else
                @week.days.create(scheduled: @week.start + mod.day, user_id: @user.id)
              end
        day.save
        v2.each do |m|
          DayMeal.create(meal_id: m, day_id: day.id)
        end
      end
    end
  end
end
