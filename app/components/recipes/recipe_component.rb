class Recipes::RecipeComponent < ViewComponent::Base
  def initialize(recipe: , show_buttons: false, show_tags: false)
    @recipe = recipe
    @show_buttons = show_buttons
    @show_tags = show_tags
  end

  private

  attr_reader :recipe, :show_tags, :show_buttons
end
