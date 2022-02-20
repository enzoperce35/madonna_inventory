class CreateInventoryItems < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_items do |t|
      t.string :name
      t.string :category
      t.string :unit
      t.float :margin
      t.float :stock

      t.timestamps
    end
  end
end
