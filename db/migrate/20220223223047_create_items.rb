class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :inventory_item_id
      t.float :amount
      t.belongs_to :inventory_update
      
      t.timestamps
    end
  end
end
