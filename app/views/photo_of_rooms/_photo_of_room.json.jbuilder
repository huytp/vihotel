json.extract! photo_of_room, :id, :image, :created_at, :updated_at
json.url photo_of_room_url(photo_of_room, format: :json)