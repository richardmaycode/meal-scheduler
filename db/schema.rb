# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_16_021352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cuisines", force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "day_meals", force: :cascade do |t|
    t.bigint "day_id", null: false
    t.bigint "meal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_day_meals_on_day_id"
    t.index ["meal_id"], name: "index_day_meals_on_meal_id"
  end

  create_table "days", force: :cascade do |t|
    t.date "scheduled"
    t.bigint "user_id", null: false
    t.bigint "week_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_days_on_user_id"
    t.index ["week_id"], name: "index_days_on_week_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plans", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "user_id", null: false
    t.bigint "day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_plans_on_day_id"
    t.index ["recipe_id"], name: "index_plans_on_recipe_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", null: false
    t.string "base", null: false
    t.string "cook_time", default: "short"
    t.integer "servings", null: false
    t.bigint "meal_id", null: false
    t.bigint "cuisine_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cuisine_id"], name: "index_recipes_on_cuisine_id"
    t.index ["meal_id"], name: "index_recipes_on_meal_id"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "user_recipes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "recipe_id", null: false
    t.boolean "is_favorite"
    t.boolean "is_kid_friendly"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_id"], name: "index_user_recipes_on_recipe_id"
    t.index ["user_id"], name: "index_user_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "name", null: false
    t.integer "default_servings", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.date "start"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_weeks_on_user_id"
  end

  add_foreign_key "day_meals", "days"
  add_foreign_key "day_meals", "meals"
  add_foreign_key "days", "users"
  add_foreign_key "days", "weeks"
  add_foreign_key "plans", "days"
  add_foreign_key "plans", "recipes"
  add_foreign_key "plans", "users"
  add_foreign_key "recipes", "cuisines"
  add_foreign_key "recipes", "meals"
  add_foreign_key "recipes", "users"
  add_foreign_key "user_recipes", "recipes"
  add_foreign_key "user_recipes", "users"
  add_foreign_key "weeks", "users"
end
