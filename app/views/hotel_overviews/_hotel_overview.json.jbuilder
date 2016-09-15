json.extract! hotel_overview, :id, :title, :content, :created_at, :updated_at
json.url hotel_overview_url(hotel_overview, format: :json)