class InventoryItem < ApplicationRecord
  has_many :inventory_updates
end
