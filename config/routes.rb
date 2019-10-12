Rails.application.routes.draw do
  
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  resources :users do
    member do 
     get  'follow'
     post 'follow'
     
     get  'unfollow'
     post 'unfollow'
     
     get  'activities'
     post 'activities'
    end
  end
  resources :litposts
  
    
  root 'static_pages#home'
  get  'static_pages/home'
  
  
  get  'activities',   to: 'static_pages#site_activities'
end