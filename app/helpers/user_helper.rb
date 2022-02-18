module UserHelper
  def user_is_principal
    current_user.username == 'pipoy'
  end

  def user_is_admin
    current_user.username == 'niel'
  end

  def user_is_dev
    current_user.username == 'inso'
  end
end
