class RecipesComponent < ViewComponent::Base
  def initialize(recipes:, user: nil)
    @recipes = recipes
    @user = user
  end

  private

  attr_reader :recipes
end
