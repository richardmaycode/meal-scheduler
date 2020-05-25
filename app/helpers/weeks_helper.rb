module WeeksHelper
  def test(week)
    week.start.strftime("%m-%d-%Y")
  end
end
