# frozen_string_literal: true

FactoryBot.define do
  factory :user_recipe do
    user
    recipe
    is_favorite { false }
    is_kid_friendly { false }
  end
end
