module InventoryItemsHelper
  def confirm(stock_update)
    stock_update.update(confirmed: true)
  end

  def apply(action, item, u)
    case action
    when 're-stock'
      item.update(stock: item.stock + u.amount)
    when 'de-stock'
      item.update(stock: item.stock - u.amount)
    end
  end

  def modify(update_items, action)
    update_items.each do |u|
      item = InventoryItem.find(u.inventory_item_id)
      apply(action, item, u)
    end
  end

  def below_margin(item)
    item.margin >= item.stock
  end
end
