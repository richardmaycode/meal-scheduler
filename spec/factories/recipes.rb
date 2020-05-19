# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    name { Faker::Name.unique.name }
    base { 'MyString' }
    cook_time { 1 }
    servings { 1 }
    meal
    cuisine
    user
  end
end
