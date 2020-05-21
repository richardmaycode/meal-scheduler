# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  default_servings :integer          not null
#  name             :string           not null
#  username         :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#


FactoryBot.define do
  factory :user do
    username { Faker::Internet.email }
    name { Faker::Name.name }
    default_servings { 1 }
  end
end
