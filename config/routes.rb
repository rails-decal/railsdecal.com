RailsDecal::Application.routes.draw do
  devise_for :users
  root to: "pages#home"

  match "apply", to: "student_applications#new", via: :get
  match "apply", to: "student_applications#create", as: "student_applications", via: :post

  resources :lectures, only: [:show, :index]
end
