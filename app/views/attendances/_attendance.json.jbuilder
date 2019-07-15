json.extract! attendance, :id, :date_attended, :deleted, :user_id, :customer_id, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
