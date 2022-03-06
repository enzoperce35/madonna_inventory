module HomeHelper
  def assign_color_to(branch)
    case branch
    when 'Sampaguita'
      "color:#3ca33c"  
    when 'Muntingpulo'
      "color:#fa7427"
    end
  end

  def time_difference(start, finish)
    time_start = Time.new(start.year, start.month)
    time_end = Time.new(finish.year, finish.month)

    TimeDifference.between(time_start, time_end).in_months
  end
end
