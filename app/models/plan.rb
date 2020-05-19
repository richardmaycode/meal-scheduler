# frozen_string_literal: true

class Plan < ApplicationRecord
  belongs_to :recipe
  belongs_to :day
  belongs_to :user
end
