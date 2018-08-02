Rails.application.routes.draw do
  devise_for :users
  resources :taskas
  resources :assignment_marks
  resources :assignments
  resources :courses
  resources :colleges
  resources :units
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
