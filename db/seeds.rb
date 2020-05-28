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

Recipe.create(name: 'Shepherd’s pie', meal_id: 3, cuisine_id: 1, base: 'Beef', cook_time: 'short', servings: 4, user_id: 1)
Recipe.create(name: 'Roast', meal_id: 3, cuisine_id: 1, base: 'Beef', cook_time: 'Medium', servings: 5, user_id: 1)
Recipe.create(name: 'Meatballs and zoodles', meal_id: 3, cuisine_id: 4, base: 'Beef', cook_time: 'Long', servings: 4, user_id: 1)
Recipe.create(name: 'BBQ meatloaf', meal_id: 3, cuisine_id: 1, base: 'Beef', cook_time: 'Long', servings: 4, user_id: 1)
Recipe.create(name: 'Beef stroganoff ', meal_id: 3, cuisine_id: 1, base: 'Beef', cook_time: 'short', servings: 5, user_id: 1)
Recipe.create(name: 'Cowboy casserole', meal_id: 3, cuisine_id: 1, base: 'Beef', cook_time: 'Medium', servings: 5, user_id: 1)
Recipe.create(name: 'Crockpot pulled pork', meal_id: 3, cuisine_id: 1, base: 'Pork', cook_time: 'Medium', servings: 4, user_id: 1)
Recipe.create(name: 'Beef and broc', meal_id: 3, cuisine_id: 3, base: 'Beef', cook_time: 'short', servings: 3, user_id: 1)
Recipe.create(name: 'Chicken terriyaki', meal_id: 3, cuisine_id: 3, base: 'Chicken', cook_time: 'short', servings: 3, user_id: 1)
Recipe.create(name: 'Hawaiian pineapple chicken', meal_id: 3, cuisine_id: 3, base: 'Chicken', cook_time: 'Long', servings: 4, user_id: 1)
Recipe.create(name: 'Chicken cordon bleu', meal_id: 3, cuisine_id: 4, base: 'Chicken', cook_time: 'Long', servings: 2, user_id: 1)
Recipe.create(name: 'Pesto chicken and veggies', meal_id: 3, cuisine_id: 4, base: 'Chicken', cook_time: 'short', servings: 4, user_id: 1)
Recipe.create(name: 'Herb chicken', meal_id: 3, cuisine_id: 4, base: 'Chicken', cook_time: 'short', servings: 2, user_id: 1)
Recipe.create(name: 'Chicken sausage and veggie skillet', meal_id: 3, cuisine_id: 1, base: 'Chicken', cook_time: 'Long', servings: 4, user_id: 1)
Recipe.create(name: 'Chicken with brussel sprouts/apples', meal_id: 3, cuisine_id: 1, base: 'Chicken', cook_time: 'short', servings: 2, user_id: 1)
Recipe.create(name: 'Creamy chicken casserole', meal_id: 3, cuisine_id: 1, base: 'Chicken', cook_time: 'Long', servings: 5, user_id: 1)
Recipe.create(name: 'Lemon pepper chicken', meal_id: 3, cuisine_id: 1, base: 'Chicken', cook_time: 'Long', servings: 2, user_id: 1)
Recipe.create(name: 'Chicken marsala', meal_id: 3, cuisine_id: 1, base: 'Chicken', cook_time: 'short', servings: 2, user_id: 1)
Recipe.create(name: 'Spicy chicken and rice', meal_id: 3, cuisine_id: 1, base: 'Chicken', cook_time: 'Long', servings: 5, user_id: 1)
Recipe.create(name: 'Taco casserole', meal_id: 3, cuisine_id: 2, base: 'Beef', cook_time: 'short', servings: 4, user_id: 1)
Recipe.create(name: 'Tacos', meal_id: 3, cuisine_id: 2, base: 'Beef', cook_time: 'short', servings: 3, user_id: 1)
Recipe.create(name: 'Tex mex sweet potatoes', meal_id: 3, cuisine_id: 2, base: 'Meatless', cook_time: 'Long', servings: 5, user_id: 1)
Recipe.create(name: 'Lemon chicken linguini', meal_id: 3, cuisine_id: 4, base: 'Chicken', cook_time: 'short', servings: 2, user_id: 1)
Recipe.create(name: 'Chicken parmasean skillet', meal_id: 3, cuisine_id: 4, base: 'Chicken', cook_time: 'Long', servings: 5, user_id: 1)
Recipe.create(name: 'Pesto chicken pasta', meal_id: 3, cuisine_id: 4, base: 'Chicken', cook_time: 'Medium', servings: 5, user_id: 1)
Recipe.create(name: 'Ham and cheese tortellini', meal_id: 3, cuisine_id: 4, base: 'Pork', cook_time: 'Long', servings: 4, user_id: 1)
Recipe.create(name: 'Quinoa red bean chili', meal_id: 3, cuisine_id: 1, base: 'Meatless', cook_time: 'Medium', servings: 5, user_id: 1)

Recipe.all.each do |r|
  UserRecipe.create(user_id: 1, recipe_id: r.id)
end