class InventoryItem < ApplicationRecord
  validates_uniqueness_of :name, on: [:create, :update]
  validates_presence_of :name, :item_type, :unit, :stock, :margin, on: [:create, :update]
  
  has_many :inventory_updates
end
