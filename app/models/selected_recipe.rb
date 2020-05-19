# frozen_string_literal: true

class SelectedRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
end
