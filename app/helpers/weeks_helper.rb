module WeeksHelper
  def week_start_display(week)
    week.start.strftime("%m-%d-%Y")
  end
end
