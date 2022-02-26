class InventoryUpdatesController < ApplicationController
  def new
    @collection = InventoryItem.all
    
    @update = InventoryUpdate.new
    @update.items.build
  end

  def create
    @update = InventoryUpdate.create(item_update_params)

    if @update.save
      redirect_to inventory_update_path(@update), method: 'show'
    end
  end
  
  def edit
    @collection = InventoryItem.all
    
    @update = InventoryUpdate.find(params[:id])
    @update.items.build
  end

  def update
    @update = InventoryUpdate.find(params[:id])

    if @update.update(item_update_params)
      redirect_to inventory_update_path(@update), method: 'show'
    end
  end

  def destroy
    @update = InventoryUpdate.find(params[:id])

    if @update.destroy
      redirect_to root_path, notice: 'check-out canceled'
    end
  end

  def show
    @update = InventoryUpdate.find(params[:id])
  end

  private

  def item_update_params
    params.require(:inventory_update).permit(:action, :note, :user_id, items_attributes: Item.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
