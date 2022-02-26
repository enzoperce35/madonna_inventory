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
    @items = InventoryItem.all
  end

  def show
    @item = InventoryItem.find(params[:id])
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
    
    helpers.confirm(stock_update)
    helpers.modify(update_items)
    
    redirect_to inventory_items_path, method:'get'
  end

  private

  def inventory_item_params
    params.require(:inventory_item).permit(:name, :item_type, :unit, :margin, :stock)
  end
end
