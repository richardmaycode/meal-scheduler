def WeekBuilder < ApplicationService
  def initialize(user, days)
    @user = user
    @days = days
  end

  def call
    scoreable_recipes = user.recipes
    @days.each do |d|
      puts d.scheduled.strftime("%A - %m-%d-%Y")
      d.meals do |m|
        puts m.name
        scoreable_recipes = user.recipes.where(meal: m)
        recipe = score_recipes(scorable_recipes)
        puts recipe.name
        # create_plan(d, recipe)
      end
    end
    score_recipes
  
  end

  def score_recipes(scorable_recipes)
    scores = []
    scoreable_recipes.each do |sr|
      hash = {}
      hash[:id] = sr.id
      hash[:score] = r.sort_score(@user)
      scores << hash
    end
    scores.sort_by! { |hsh| -hsh[:score] }
    recipe_id = scores[0][:id]
  end

  def create_plan(day, recipe)
    Plan.create!(recipe_id: recipe, day_id: day.id, @user.id)
  end
end