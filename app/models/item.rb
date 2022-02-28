class Item < ApplicationRecord
  belongs_to :inventory_update, optional: true
  belongs_to :user, optional: true
end
