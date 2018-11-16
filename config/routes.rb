Rails.application.routes.draw do

  resources :answers
  resources :questions
  namespace :instructor do
    root 'dashboard#index'
    get 'dashboard', to: 'dashboard#index', as: 'dashboard'
    resources :courses, except: :index
    resources :units, except: :index
    resources :assignments, except: :index
    get 'assignments/new/:id', to: 'assignments#new', as: 'new_assignment'
    resources :assignment_marks
    resources :quizzes, except: :index
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
  resources :quizzes, only: :show do
    get 'start', to: 'quizzes#start', as: 'start_quiz'
    post 'submit', to: 'quizzes#submit', as: 'submit_quiz'
  end
  #resources :enrols 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
