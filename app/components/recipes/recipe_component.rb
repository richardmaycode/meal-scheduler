class Recipes::RecipeComponent < ViewComponent::Base
  def initialize(recipe:)
    @recipe = recipe
  end

  private

  attr_reader :recipe
end
