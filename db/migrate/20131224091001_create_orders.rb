class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :order_number
      t.decimal :order_subtotal
      t.decimal :order_tax
      t.decimal :order_total
      t.integer :order_status
      t.text :customer_note
      t.string :ip_address
      t.references :user, index: true

      t.timestamps
    end
  end
end
