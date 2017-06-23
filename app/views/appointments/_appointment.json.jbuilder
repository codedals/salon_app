json.extract! appointment, :id, :user_id, :salon_id, :accepted, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)