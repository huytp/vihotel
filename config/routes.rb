Rails.application.routes.draw do
  resources :parent_room_types do
    resources :room_types
  end
  resources :room_types do
    resources :photo_of_rooms, except: [:create, :update]
    post 'photo_of_rooms/new', to: "photo_of_rooms#create"
    post 'photo_of_rooms/:id/edit', to: "photo_of_rooms#update"
  end
  resources :hotel_overviews do
    resources :photo_overviews, except: [:create, :update]
    post 'photo_overviews/new', to: "photo_overviews#create"
    post 'photo_overviews/:id/edit', to: "photo_overviews#update"
  end
  root 'homes#index'
end
