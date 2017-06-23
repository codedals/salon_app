json.extract! salon_image, :id, :name, :image_url, :type, :salon_id, :created_at, :updated_at
json.url salon_image_url(salon_image, format: :json)