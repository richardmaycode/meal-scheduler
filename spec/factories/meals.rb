FactoryBot.define do
  factory :meal do
    name { Faker::Name.unique.name }
    status { 1 }
  end
end
