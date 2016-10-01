Rails.application.routes.draw do
  resources :room_features
  get "contact", to: "contacts#index", as: "contact_index"
  post "contact", to: "contacts#create", as: "contacts"
  resources :posts
  resources :excursions, only: [:index] do
    collection do
      get ":friendly", to: "excursions#show", as: "show_excursion"
    end
  end

  resources :events, only: [:index] do
    collection do
      get ":friendly", to: "events#show", as: "show_event"
    end
  end
  resources :offer, only: :index do
    collection do
      get ":friendly", to: "offer#show", as: "show_offer"
    end
  end
  resources :offers
  resources :accommodation, only: [:index] do
    collection do
      get ":friendly", to: "accommodation#show", as: "show_accomodation"
    end
  end
  resources :service, only: [:index] do
    collection do
      get ":title", to: "service#show", as: "show_service"
    end
  end

  resources :about, only: :index
  root "homes#index"
  resources :reservations

  resources :parent_room_types do
    resources :room_types
  end
  resources :room_types do
    resources :photo_of_rooms, except: [:create, :update]
    post "photo_of_rooms/new", to: "photo_of_rooms#create"
    post "photo_of_rooms/:id/edit", to: "photo_of_rooms#update"
  end
  resources :hotel_overviews do
    resources :photo_overviews, except: [:create, :update]
    post "photo_overviews/new", to: "photo_overviews#create"
    post "photo_overviews/:id/edit", to: "photo_overviews#update"
  end
end
