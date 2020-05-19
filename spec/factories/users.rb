# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.email }
    name { Faker::Name.name }
    default_servings { 1 }
  end
end
