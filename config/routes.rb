Rails.application.routes.draw do

  get '/login' => 'admin/sessions#new'
  get '/logout' => 'admin/sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :posts 
    resources :sessions, only: [:new, :create, :destroy]
    resources :moderators, only: [:index, :edit, :update]
  end
end
