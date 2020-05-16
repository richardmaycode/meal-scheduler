FactoryBot.define do
  factory :recipe do
    name { "MyString" }
    base { "MyString" }
    cook_time { 1 }
    servings { 1 }
    meal
    cuisine
    user
  end
end
