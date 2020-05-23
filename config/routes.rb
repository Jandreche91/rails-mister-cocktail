Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, except: [:new, :edit] do
    resources :doses, only: [:create, :edit, :update]
  end
  resources :doses, only: [:destroy]
  root 'cocktails#index'
end
