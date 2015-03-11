Rails.application.routes.draw do
  devise_for :users
  devise_for :installs
   root to: 'articles#index'
   get '/articles' => 'articles#index'
   get '/articles/new' => 'articles#new'
   post '/articles' => 'articles#create'
   get '/articles/:id' => 'articles#show'
end
