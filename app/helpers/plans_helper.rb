module PlansHelper
  def icon(plan)
    case plan.meal
    when 'Breakfast'
      "fa-egg-fried"
    when 'Lunch'
      "fa-soup"
    when 'Dinner'
      "fa-turkey"
    when 'Other'
      "fa-brownie"
    else 
      "fa-brownie"
    end
  end
end
