class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.string :cart_number
      t.decimal :cart_total
      t.string :ip_address
      t.references :user, index: true

      t.timestamps
    end
  end
end
