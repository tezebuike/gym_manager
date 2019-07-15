json.extract! subscription, :id, :receipt_number, :mode_of_payment, :start_date, :end_date, :amount_paid, :balance, :discount, :status, :customer_id, :plan_id, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
