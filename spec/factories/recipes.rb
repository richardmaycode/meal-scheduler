FactoryBot.define do
  factory :recipe do
    name { "MyString" }
    base { "MyString" }
    cook_time { 1 }
    servings { 1 }
    baby_friendly { false }
    meal
    cuisine
    factory :baby_friendly_recipe do
      baby_friendly { true }
    end
  end
end
