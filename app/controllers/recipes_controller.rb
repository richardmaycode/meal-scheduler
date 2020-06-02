class RecipesController < ApplicationController
  before_action :set_user
  before_action :set_recipe, only: %w[show edit update delete]
  
  def index
    @recipes = Recipe.includes([:cuisine, :meal]).all
  end

  def show; end

  def new 
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
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
      params.require(:recipe).permit(:name, :meal_id, :cuisine_id, :cook_time, :servings, :base, :user_id, :is_kid_friendly, :is_fav)
    end

    def set_user
      # TODO assign to current User
      @user = User.first
    end
    
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
end
