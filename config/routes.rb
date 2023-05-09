Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/shops', to: 'shops#index'
  get '/shops/:id', to: 'shops#show'
  get '/shops/:id/pies', to: 'shops/pies#index'

  get 'pies', to: 'pies#index'
  get 'pies/:id', to: 'pies#show'
end
