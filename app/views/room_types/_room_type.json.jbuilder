json.extract! room_type, :id, :room_type_name, :description, :room_size, :room_bed, :room_view, :room_features, :created_at, :updated_at
json.url room_type_url(room_type, format: :json)