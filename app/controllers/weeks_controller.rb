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
      params[:week][:days].each do |k, v|
        puts k
        v.each do |k2, v2|
          case k
          when "0"
            day = @week.days.create(scheduled: @week.start, user_id: @user.id)            
          else 
            mod = k.to_i
            day = @week.days.create(scheduled: @week.start + mod.day, user_id: @user.id)
          end
          day.save
          v2.each do |m|
            DayMeal.create(meal_id: m, day_id: day.id)
            puts m
          end
        end
      end
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
    @week = Week.includes(days: [:meals]).find(params[:id])
  end  
end
