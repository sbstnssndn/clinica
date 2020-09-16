Rails.application.routes.draw do
  resources :patients
  resources :appointments
  devise_for :users
  resources :exam_batteries
  resources :exams
  resources :exam_associations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "exams#index"
end
