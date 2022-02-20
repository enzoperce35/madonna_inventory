class CreateInventoryUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_updates do |t|
      t.string :action
      t.float :amount
      t.text :note
      t.belongs_to :user
      t.belongs_to :inventory_item

      t.timestamps
    end
  end
end
