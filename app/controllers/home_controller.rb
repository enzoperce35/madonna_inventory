class HomeController < ApplicationController
  def index
    @activities = InventoryUpdate.where(confirmed: true).order(updated_at: :desc)
    
    if helpers.user_is_admin
      redirect_to new_inventory_update_path, method: 'get'
    end
  end
end
