json.extract! photo_overview, :id, :image, :created_at, :updated_at
json.url photo_overview_url(photo_overview, format: :json)