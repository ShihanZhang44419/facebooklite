Rails.application.routes.draw do
  
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  
  root 'static_pages#home'
  get  'static_pages/home'
  
  resources :users do
   
  end
end