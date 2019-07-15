json.extract! customer, :id, :slug, :first_name, :middle_name, :email, :phone_number, :address, :gender, :date_of_birth, :date_joined, :status, :created_at, :updated_at
json.url customer_url(customer, format: :json)
