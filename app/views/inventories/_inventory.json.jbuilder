json.extract! inventory, :id, :date, :item, :inventory_type, :cost_price, :quantity, :selling_price, :sold_for, :status, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
