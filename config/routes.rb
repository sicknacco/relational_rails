Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/shops', to: 'shops#index'
  get '/shops/new', to: 'shops#new'
  post '/shops', to: 'shops#create'
  get '/shops/:id', to: 'shops#show'
  get '/shops/:id/pies', to: 'shops/pies#index'
  get '/shops/:id/edit', to: 'shops#edit'
  patch '/shops/:id', to: 'shops#update'

  get 'pies', to: 'pies#index'
  get 'pies/:id', to: 'pies#show'
end
