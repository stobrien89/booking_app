Rails.application.routes.draw do
  root 'pages#home'
  
  devise_for :users,
            path: '',
            path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'registration'},
            controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :rooms, except: [:edit] do 
    member do 
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      delete 'delete_image_attachment'
      get 'amenities'
      get 'location'
    end
    resources :reservations, only: [:create]
  end

  resources :guest_reviews, only: [:create, :destroy]
  resources :host_reviews, only: [:create, :destroy]

  get '/your_trips' => 'reservations#your_trips'
  get '/your_reservations' => 'reservations#your_reservations'
  get 'search' => 'pages#search'

  get '*path', to: 'pages#home', via: :all, constraints: lambda { |req|
  req.path.exclude? 'rails/active_storage'
}
end
