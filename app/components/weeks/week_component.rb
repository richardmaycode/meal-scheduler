class Weeks::WeekComponent < ViewComponent::Base
  include WeeksHelper
  def initialize(week:)
    @week = week
  end

  private 

  def url_text
    week_start_display week
  end

  attr_reader :week
end
