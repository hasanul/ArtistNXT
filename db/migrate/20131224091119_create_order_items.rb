class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.string :product_name
      t.integer :product_quantity
      t.decimal :product_item_price
      t.decimal :product_tax
      t.decimal :product_final_price
      t.integer :order_status
      t.references :order, index: true

      t.timestamps
    end
  end
end
