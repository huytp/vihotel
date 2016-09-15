Rails.application.routes.draw do
  resources :hotel_overviews
  root 'homes#index'
end
