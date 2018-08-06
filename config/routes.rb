Rails.application.routes.draw do
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
