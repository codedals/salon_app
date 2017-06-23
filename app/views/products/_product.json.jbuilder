json.extract! product, :id, :name, :price, :description, :type, :salon_id, :created_at, :updated_at
json.url product_url(product, format: :json)