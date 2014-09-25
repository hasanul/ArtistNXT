class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.string :product_name
      t.integer :quantity
      t.decimal :product_price
      t.decimal :product_final_price
      t.references :cart, index: true

      t.timestamps
    end
  end
end
