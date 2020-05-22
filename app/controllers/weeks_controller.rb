class WeeksController < ApplicationController
  before_action :set_user
  before_action :set_week, only: %i[show destroy]
  def index
    @weeks = @user.weeks.all
  end

  def show; end

  def new
    @week = Week.new
  end

  def create
    @week = Week.new(week_params)
    if @week.save
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
    require(:week).permit(:start, :user_id)
  end

  def set_user
    @user = User.first
  end

  def set_week
    @week = Week.find(params[:id])
  end  
end
