module InventoryItemsHelper
  def confirm(stock_update)
    stock_update.update(confirmed: true)
  end

  def modify(update_items)
    update_items.each do |u|
      item = InventoryItem.find(u.inventory_item_id)
      item.update(stock: item.stock - u.amount)
    end
  end
end
