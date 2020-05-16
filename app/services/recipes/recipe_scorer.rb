module Recipes
  class RecipeScorer < ApplicationService
    def initialize(recipe, user)
      @recipe = recipe
      @user = user
    end
  
    def call
      return false unless get_score

      get_score
    end

    def get_score
      10
    end
  end  
end
