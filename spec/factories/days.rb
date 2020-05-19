# frozen_string_literal: true

FactoryBot.define do
  factory :day do
    scheduled { '2020-05-15' }
    user { nil }
  end
end
