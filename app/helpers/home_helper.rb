module HomeHelper
  def assign_color_to(branch)
    case branch
    when 'Sampaguita'
      "color:#3ca33c"  
    when 'Muntingpulo'
      "color:#fa7427"
    end
  end
end
