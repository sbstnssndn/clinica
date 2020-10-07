Rails.application.routes.draw do
  devise_for :users, path_names: {
    sign_up: 'register',
    sign_in: 'login'
  }, controllers: {
    registrations: 'registrations'
  }

  scope '/admin' do
    resources :users do
      collection do
        get :profile_partial
      end

      member do
        put :toggle_approbation
      end
    end
  end

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
