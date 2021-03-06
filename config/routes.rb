Rails.application.routes.draw do
  root   'sessions#new'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :rooms
  resources :messages
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
