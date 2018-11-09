Rails.application.routes.draw do

  resources :clinical_reviews
  resources :art_assessment_and_plans
  resources :social_assessments
  resources :general_conditions
  resources :medical_histories
  resources :art_patients do
    collection do
      get 'load_patients'
      post 'create_from_search'
      get 'load_referral'
    end
  end
  resources :patients do
    collection do
      get 'load_patients'
      post 'create_from_search'
    end
  end
  resources :regions
  resources :departments
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
  }
  scope "/admin" do
    resources :users do
      collection do
        get 'load_users'
      end
    end
  end

  resources :facilities do
    collection do
      get 'load_facilities'
    end
  end
  resources :facility_types
  resources :organization_structures do
    collection do
      get 'load_tree'
      get 'load_facility_tree'
      get 'load_sub_units'
    end
  end
  resources :organization_structure_types
  resources :roles
  get 'home/index'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
