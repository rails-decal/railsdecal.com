RailsDecal::Application.routes.draw do
  devise_for :users
  root to: "pages#home"

  match "apply", to: "student_applications#new", via: :get

  resources :lectures, only: [:show, :index]
end
