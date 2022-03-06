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

  def sum_all(updates, id, sum = 0)
    updates.each do |update|
      sum += update.items.where(inventory_item_id: id).sum(:amount)
    end
    sum
  end

  def check_out_sum_of(item, branches = ['Sampaguita', 'Muntingpulo'], sums = [])
    return sums if branches.empty?
    
    updates = @updates.where(confirmed: true, updated_branch: branches.pop)
    
    sums << sum_all(updates, item.id)
    
    check_out_sum_of(item, branches, sums)
  end

  def next_order(order)
    case order
    when nil
      'alphabetical'
    when 'alphabetical'
      'category'
    when 'category'
      nil
    end
  end

  def apply_order(order)
    case order
    when 'category'
      InventoryItem.order(:item_type)
    when 'alphabetical'
      InventoryItem.order(:name)
    when nil
      InventoryItem.order(updated_at: :desc)
    end
  end
end
