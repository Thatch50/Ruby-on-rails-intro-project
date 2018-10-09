Rails.application.routes.draw do
  resources :pokemons, only: [:index, :show]
  resources :moves, only: [:index, :show]
  resources :types, only: [:index, :show]
end
