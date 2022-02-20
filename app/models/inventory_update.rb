class InventoryUpdate < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :inventory_item, optional: true
end
