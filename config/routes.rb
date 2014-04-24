RailsDecal::Application.routes.draw do
  root to: "pages#home"

  match 'why', to: 'pages#why_this_class', via: :get
  match "apply", to: "student_applications#new", as: "apply", via: :get
  match "apply", to: "student_applications#create", as: "student_applications", via: :post
  match 'student_applications/evaluations', to: 'evaluations#index', as: 'evaluations', via: :get

  resources :lectures, only: [:show, :index]
  resources :student_applications do
    match 'evaluate', to: 'evaluations#create', as: 'evaluate', via: [:post, :patch]
  end

  devise_for :users, path: '',
                     skip: [:registrations],
                     path_names: { sign_in: 'login', sign_up: 'sign-up', sign_out: 'logout'},
                     controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, param: :nickname, only: [:show]

  namespace :admin do
    match '/', to: redirect('/admin/dashboard'), via: :get
    match 'dashboard', to: 'pages#dashboard', via: :get
    resources :users, only: [:index]
  end

end
