class HomeController < ApplicationController
  def index
    @check_outs = InventoryUpdate.where(confirmed: true)
    
    if helpers.user_is_admin
      redirect_to inventory_items_path, method: 'get'
    end
  end
end
