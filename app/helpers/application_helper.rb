module ApplicationHelper
  def user_has_no_branch
    current_user.branch.nil?
  end
  
  def branch_name
    if !user_signed_in? || user_has_no_branch
      ''
    else
      current_user.branch.prepend(' - ')
    end
  end
end
