# frozen_string_literal: true

# == Schema Information
#
# Table name: meals
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


FactoryBot.define do
  factory :meal do
    name { Faker::Name.unique.name }
    status { 1 }
  end
end
