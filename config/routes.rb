Rails.application.routes.draw do
  devise_for :users
  devise_for :installs
   root to: 'articles#index'
   get '/articles' => 'articles#index'
   get '/articles/new' => 'articles#new'
   post '/articles' => 'articles#create'
   get '/articles/:id' => 'articles#show'
   get '/articles/:id/edit' => 'articles#edit'
   patch '/articles/:id' => 'articles#update'
   delete '/articles/:id' => 'articles#destroy'
   get '/profile' => 'users#show'
end
