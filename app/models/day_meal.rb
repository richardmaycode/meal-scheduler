# frozen_string_literal: true

class DayMeal < ApplicationRecord
  belongs_to :day
  belongs_to :meal
end
