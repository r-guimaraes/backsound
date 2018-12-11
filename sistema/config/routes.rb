Rails.application.routes.draw do
  root to: "home#index"

  get 'artists/index'
  get 'artists/show'

  resources :playlists

  devise_for :users

  resources :users

  get "como_funciona", to: "home#como_funciona"
  get "sobre", to: "home#sobre"
  get "contato", to: "home#contato"
  get "planos", to: "home#planos"
  get "/buscar_bandas", to: "artists#index"
  get "/bandas/:id", to: "artists#show", as: "artist"
end
