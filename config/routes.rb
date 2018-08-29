Rails.application.routes.draw do

  namespace :instructor do
    root 'dashboard#index'
    get 'dashboard', to: 'dashboard#index', as: 'dashboard'
    resources :courses, except: :index
    resources :units, except: :index
    resources :assignments, except: :index
    get 'assignments/new/:id', to: 'assignments#new', as: 'new_assignment'
    resources :assignment_marks
  end

  #get 'my_cert', to: 'my_cert#index'
  #get 'my_cert/:id', to: 'my_cert#show'

  resources :my_cert, only: [:index, :show]

  resources :classrooms
  get 'locations/index'

  get 'locations/show'

  resources :certificates
  get 'my_course', to: 'my_course#index'
  get 'my_course/:id', to: 'my_course#show', as: 'view_mycourse'
  post 'my_course/:id', to: 'my_course#award', as: 'award'

  root 'home#index'

  devise_for :users
  resources :assignment_marks
  resources :assignments
  resources :courses do 
  	post 'enrol'
  end
  resources :colleges
  resources :units
  #resources :enrols 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
