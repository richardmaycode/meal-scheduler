class RecipesController < ApplicationController
  before_action :set_recipe, only: %w[show edit update delete]
  
  def index
    @recipes = Recipe.all
  end

  def show; end

  def new 
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def delete
  end

  private

    def recipe_params
      params.require(:recipe).permit()
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
end
