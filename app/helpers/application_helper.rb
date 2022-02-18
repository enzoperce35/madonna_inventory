module ApplicationHelper
  def user_is_admin
    !current_user.branch.nil?
  end
  
  def branch_name
    if !user_signed_in? || !user_is_admin
      ''
    else
      current_user.branch.prepend(' - ')
    end
  end
end
