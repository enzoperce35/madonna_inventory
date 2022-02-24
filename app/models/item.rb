class Item < ApplicationRecord
  belongs_to :inventory_update, optional: true
end
