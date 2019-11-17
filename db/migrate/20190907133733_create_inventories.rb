class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.date :date
      t.string :item
      t.string :inventory_type
      t.float :cost_price
      t.integer :quantity
      t.float :selling_price
      t.string :sold_for
      t.string :status

      t.timestamps
    end
  end
end
