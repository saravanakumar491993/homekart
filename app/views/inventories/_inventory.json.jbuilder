json.extract! inventory, :id, :product_id, :available_count, :threshold_count, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
