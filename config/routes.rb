Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  root "cards#index"
  resources :cards, only: [:index, :show, :create, :update, :destroy]

  resources :users, param: :_username
  post '/auth/register', to: 'users#create'
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
