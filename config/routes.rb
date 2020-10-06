Rails.application.routes.draw do
  devise_for :users
  resources :appointments
  resources :reports do
    collection do
      post :bulk_create
    end

    member do
      get :complete
    end
  end
  resources :patients
  resources :exams
  resources :batteries do
    collection do
      put :update_order
    end
  end

  root 'appointments#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
