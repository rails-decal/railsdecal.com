RailsDecal::Application.routes.draw do
  root to: "pages#home"

  get "apply", to: "student_applications#new", as: "apply" if Rails.env.production?
  post "apply", to: "student_applications#create", as: "student_applications" if Rails.env.production?
  get "office-hours", to: "pages#office_hours"
  get "why", to: "pages#why"

  devise_for :users, path: "",
                     skip: [:registrations],
                     path_names: {
                       sign_in: "login",
                       sign_out: "logout",
                       sign_up: "sign-up",
                     },
                     controllers: {
                       omniauth_callbacks: "users/omniauth_callbacks",
                       sessions: "sessions",
                     }

  resources :absences, only: [:create, :index, :new]
  resources :assignments
  resources :assignment_submissions, only: [:create, :update]
  # resources :lectures, only: [:index, :show]
  resources :student_applications, only: [:create, :new]
  resources :users, only: [:edit, :show, :update] do
    member do
      post "check-in", to: "check_ins#create"
    end
  end

  namespace :admin do
    get "/", to: redirect("/admin/dashboard")
    get "dashboard", to: "pages#dashboard"

    get "student-applications", to: "pages#student_applications", as: "student_applications_per_semester"
    scope "student-applications" do
      scope ":semester_url" do
        get "evaluations", to: "evaluations#index", as: "evaluations"
        resources :student_applications, path: "", only: [:show, :index] do
          member do
            match "evaluate", to: "evaluations#create", as: "evaluate", via: [:patch, :post]
            patch "accept", to: "student_applications#accept", as: "accept"
            patch "pend", to: "student_applications#pend", as: "pend"
          end
        end
      end
    end

    resources :users, only: [:index] do
      collection do
        get "students", to: "users#students"
      end
    end

    resources :check_in_codes, path: "check-in-codes", only: [:index, :show, :new, :create] do
      member do
        post "disable", to: "check_in_codes#disable"
        post "enable",  to: "check_in_codes#enable"
      end
    end

    resources :absences do
      member do
        patch "accept", to: "absences#accept", as: "accept"
        patch "reject", to: "absences#reject", as: "reject"
      end
    end
    resources :semesters, only: [:create, :new, :show]
    resources :assignments, only: [:index, :show]
    resources :assignment_submissions, only: [:show, :update]
  end

  get "*path", to: "pages#error", as: "error_page"
end
