# frozen_string_literal: true

class Meal < ApplicationRecord
  enum status: %i[active inactive pending_approval]
  # validations
  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 75 }
  validates :status, presence: true
end
