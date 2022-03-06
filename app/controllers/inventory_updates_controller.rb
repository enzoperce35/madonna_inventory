class InventoryUpdatesController < ApplicationController
  def new
    @collection = InventoryItem.all
    
    @update = InventoryUpdate.new
    @update.items.build
    @action = params[:process].present? ? params[:process] : 'de-stock'
  end

  def index
    @date_item = params[:date].to_date

    @updates = InventoryUpdate.where(updated_at: @date_item.beginning_of_day..@date_item.end_of_day).order(updated_at: :desc)
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
    params.require(:inventory_update).permit(:action, :note, :user_id, :updated_branch, items_attributes: Item.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
