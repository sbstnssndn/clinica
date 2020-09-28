Rails.application.routes.draw do
  resources :appointments
  resources :reports do
    collection do
      post 'bulk_create'
    end
  end
  resources :patients
  resources :exams
  resources :batteries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
