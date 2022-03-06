class HomeController < ApplicationController
  def index
    @activities = InventoryUpdate.where(confirmed: true).order(updated_at: :desc)
    
    if helpers.user_is_admin
      redirect_to new_inventory_update_path, method: 'get'
    end
  end

  def delete_updates
    updates = params[:updates]

    InventoryUpdate.where(confirmed: updates).destroy_all

    redirect_back(fallback_location: root_path)
  end

  def delete_month
    start = Date.parse(params[:start])
    
    InventoryUpdate.where(created_at: start.beginning_of_month..start.end_of_month).destroy_all

    redirect_back(fallback_location: root_path)
  end
end
