class WeeksController < ApplicationController
  before_action :set_user
  before_action :set_week, only: %i[show destroy]
  def index
    @weeks = @user.weeks.all
  end

  def show; end

  def new
    @week = Week.new
    @days = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
  end

  def create
    @week = Week.new(week_params)
    @days = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
    if @week.save
      WeekBuilder.call(@week, params[:week][:days], @user)
      redirect_to @week
    else
      render :new
    end
  end

  def destroy
    @week.destroy
    redirect_to [:weeks]
  end

  private

  def week_params
    params.require(:week).permit(:start, :user_id, :days)
  end

  def set_user
    @user = User.first
  end

  def set_week
    @week = Week.includes(days: [:meals, :plans]).find(params[:id])
  end  
end
