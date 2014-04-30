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

  resources :users, only: [:show]

  namespace :admin do
    match '/', to: redirect('/admin/dashboard'), via: :get
    match 'dashboard', to: 'pages#dashboard', via: :get

    match 'student-applications', to: 'pages#student_applications', as: 'student_applications', via: :get
    scope 'student-applications' do
      scope ':semester_url' do
        match 'evaluations', to: 'evaluations#index', as: 'evaluations', via: :get
        resources :student_applications, path: '', only: [:show, :index] do
          member do
            match 'evaluate', to: 'evaluations#create', as: 'evaluate', via: [:post, :patch]
          end
        end
      end
    end

    resources :users, only: [:index]
  end

  match "*path", to: 'pages#error', as: 'error_page', via: :get
end
