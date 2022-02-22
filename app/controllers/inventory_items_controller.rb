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
    previous = @item.stock
    current = params[:inventory_item][:stock]
    
    if @item.update(inventory_item_params)
      update_re_stock(@item) if stock_added(previous, current)
      
      redirect_to inventory_items_path, notice: 'edit successful'
    else
      redirect_back(fallback_location: root_path, notice: 'edit unsuccessful')
    end
  end

  private

  def inventory_item_params
    params.require(:inventory_item).permit(:name, :item_type, :unit, :margin, :stock)
  end

  def update_re_stock(item)
    item.update(re_stock: DateTime.now)
  end

  def stock_added(previous, current)
    current.to_i > previous
  end
end
