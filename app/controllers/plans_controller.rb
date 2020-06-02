class PlansController < ApplicationController
  before_action :set_user
  before_action :set_plan, only: %w[edit update destroy]

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.create(plan_params)
    if @plan.save
      redirect_to @plan.week
    else
      render :new
    end
  end

  def edit; end

  def update
    if @plan.update(plan_params)
      redirect_to @plan.week
    else
      render :edit
    end
  end

  def destroy
    @plan.destroy
    redirect_to @plan.week
  end

  private

  def plan_params
    params.reqiure(:plan).permit(:day_id, :recipe_id, :user_id, :meal_id)
  end

  def set_user
    # TODO assign to current User
    @user = User.first
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end
end
