class AddCurrencyToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :order_currency, :string
  end
end
