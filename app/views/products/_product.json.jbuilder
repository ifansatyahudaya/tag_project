json.extract! product, :id, :name, :qty, :price, :created_at, :updated_at
json.url product_url(product, format: :json)