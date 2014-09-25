json.array!(@cart_items) do |cart_item|
  json.extract! cart_item, :id, :cart_id, :product_id, :product_name, :quantity, :product_price, :product_final_price
  json.url cart_item_url(cart_item, format: :json)
end
