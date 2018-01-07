json.extract! product, :id, :product_id, :product_name, :mrp, :srp, :seller_id, :discount, :created_at, :updated_at
json.url product_url(product, format: :json)
