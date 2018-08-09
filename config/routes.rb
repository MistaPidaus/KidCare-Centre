Rails.application.routes.draw do
  
  resources :certificates
  get 'my_course', to: 'my_course#index'
  get 'my_course/:id', to: 'my_course#show', as: 'view_mycourse'
  post 'my_course/:id', to: 'my_course#award', as: 'award'

  root 'home#index'

  devise_for :users
  resources :taskas
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
