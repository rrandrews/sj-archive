Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :episodes
  resources :clues, :only => [:index, :show]
  resources :contestants, :only => [:index, :create]
  root to: 'episodes#index'
end
