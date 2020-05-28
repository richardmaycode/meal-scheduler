module Recipes
  class RecipeScorer < ApplicationService
    def initialize(recipes, user, date)
      @recipes = recipes
      @user = user
      @date = date
    end

    def call
      get_score
    end

    def get_score
      scores = []
      @recipes.each do |sr|
        hash = {}
        hash[:id] = sr.id
        hash[:score] = sr.sort_score(@user, @date)
        scores << hash
      end
      puts scores
      scores.sort_by! { |hsh| -hsh[:score] }

      scores[0][:id]
    end
  end
end
