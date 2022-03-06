class CreateInventoryUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_updates do |t|
      t.string :action
      t.string :updated_branch
      t.boolean :confirmed, default: false
      t.text :note
      t.belongs_to :user

      t.timestamps
    end
  end
end
