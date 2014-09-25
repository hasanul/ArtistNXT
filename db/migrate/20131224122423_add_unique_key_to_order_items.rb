class AddUniqueKeyToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :unique_key, :string
  end
end
