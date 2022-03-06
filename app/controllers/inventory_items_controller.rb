class InventoryItemsController < ApplicationController
  def new
    @item = InventoryItem.new
  end

  def create
    @item = InventoryItem.create(inventory_item_params)
    
    if @item.save
      redirect_back(fallback_location: root_path, notice: 'item saved!')
    else
      redirect_to root_path, notice: 'failed to save item'
    end
  end

  def index
    user_start = params[:start]
    user_end = params[:end]
    @picker = params[:picker]
    @order = params[:order]
      
    @begin_date = user_start.nil? ? Date.today.beginning_of_week : user_start.to_date
    @end_date = user_end.nil? ? Date.today : user_end.to_date
      
    @updates = InventoryUpdate.where(updated_at: @begin_date.beginning_of_day..@end_date.end_of_day)

    @items = helpers.apply_order(@order)
  end

  def show
    @item = InventoryItem.find(params[:id])
    @check_outs = Item.where(inventory_item_id: @item.id).order(updated_at: :desc)
  end

  def destroy
    @item = InventoryItem.find(params[:id])
  
    if @item.destroy
      redirect_to inventory_items_path, notice: 'item deleted'
    else
      redirect_back(fallback_location: root_path, notice: 'item not deleted')
    end
  end
  
  def edit
    @item = InventoryItem.find(params[:id])
  end

  def update
    @item = InventoryItem.find(params[:id])
    
    if @item.update(inventory_item_params)
      redirect_to inventory_items_path, notice: 'edit successful'
    else
      redirect_back(fallback_location: root_path, notice: 'edit unsuccessful')
    end
  end

  def apply_update
    stock_update = InventoryUpdate.find(params[:id])
    update_items = stock_update.items
    action = stock_update.action
    
    helpers.confirm(stock_update)
    helpers.modify(update_items, action)
    
    redirect_to inventory_items_path, method:'get'
  end

  private

  def inventory_item_params
    params.require(:inventory_item).permit(:name, :item_type, :unit, :margin, :stock)
  end
end
