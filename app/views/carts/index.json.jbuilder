json.array!(@carts) do |cart|
  json.extract! cart, :id, :user_id, :cart_number, :cart_total, :ip_address
  json.url cart_url(cart, format: :json)
end
