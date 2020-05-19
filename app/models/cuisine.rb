# frozen_string_literal: true

class Cuisine < ApplicationRecord
  enum status: %i[active inactive pending_approval]
  # validations
  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 15 }
  validates :status, presence: true
end
