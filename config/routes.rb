Rails.application.routes.draw do
  resources :reports
  resources :patients
  resources :appointments
  devise_for :users
  resources :exam_batteries
  resources :exams
  resources :exam_associations
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "exams#index"
end
