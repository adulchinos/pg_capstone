Rails.application.routes.draw do
  devise_for :users
  devise_for :installs
  namespace :api do
    namespace :v1 do
    get '/comments' => 'comments#index'
    post '/comments' => 'comments#create'
    end
  end
   root to: 'articles#index'
   get '/articles' => 'articles#index'
   get '/articles/new' => 'articles#new'
   post '/articles' => 'articles#create'
   get '/articles/:id' => 'articles#show'
   get '/articles/:id/edit' => 'articles#edit'
   patch '/articles/:id' => 'articles#update'
   delete '/articles/:id' => 'articles#destroy'
   get '/profile' => 'users#show'

   get '/informations/:id' => 'informations#show'
end
