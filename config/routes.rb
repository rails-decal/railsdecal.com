RailsDecal::Application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :lectures, only: [:show, :index]
end
