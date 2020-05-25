# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
meals = %w[Breakfast Lunch Dinner Other]
cuisines = %w[American Chinese Itilian Mexican]

meals.each do |m|
  Meal.create(name: m, status: 0)
end

cuisines.each do |c|
  Cuisine.create(name: c, status: 0)
end

User.create(username: 'testing', name: 'Richard Wise', default_servings: 2)

Recipe.create(name: "", meal_id: , cuisine_id: , base: "", cooking_time: , servings: , user_id: 1)
