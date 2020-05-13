class User < ApplicationRecord
  # validations
  validates :username, presence: true, uniqueness: true, length: { minimum: 5, maximum: 30 }
  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 30 }
  validates :default_servings, presence: true, inclusion: { in: 1..5 }
end
