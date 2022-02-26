class InventoryUpdate < ApplicationRecord
  belongs_to :user, optional: true
  
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true,
    reject_if: proc { |att| att['amount'].blank? || att['inventory_item_id'].blank? }
end
