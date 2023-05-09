Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/shops', to: 'shops#index'
  get '/shops/:id', to: 'shops#show'
end
