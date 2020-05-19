# frozen_string_literal: true

class Day < ApplicationRecord
  # associations
  belongs_to :user
  has_many :day_meals
  has_many :meals, through: :day_meals
  has_many :plans
  has_many :recipes, through: :plans

  # validations
  validates :scheduled, presence: true
end
