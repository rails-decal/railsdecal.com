RailsDecal::Application.routes.draw do
  root to: "pages#home"

  match 'why', to: 'pages#why_this_class', via: :get
  match "apply", to: "student_applications#new", as: "apply", via: :get
  match "apply", to: "student_applications#create", as: "student_applications", via: :post

  resources :lectures, only: [:show, :index]
  resources :student_applications, only: [:new, :create]

  devise_for :users, path: '',
                     skip: [:registrations],
                     path_names: { sign_in: 'login', sign_up: 'sign-up', sign_out: 'logout'},
                     controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'sessions' }

  resources :users, param: :nickname, only: [:show]

  namespace :admin do
    match '/', to: redirect('/admin/dashboard'), via: :get
    match 'dashboard', to: 'pages#dashboard', via: :get
    match 'student_applications/evaluations', to: 'evaluations#index', as: 'evaluations', via: :get
    resources :student_applications, only: [:show, :index] do
      match 'evaluate', to: 'evaluations#create', as: 'evaluate', via: [:post, :patch]
    end
    resources :users, only: [:index]
  end

  match "*path", to: 'pages#error', as: 'error_page', via: :get
end
