Rails.application.routes.draw do
  root to: 'pages#home'
  # get 'authors/first_name'
  # get 'authors/last_name'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :authors

  resources :books do
    resources :reviews
  end

  resources :categories
end
