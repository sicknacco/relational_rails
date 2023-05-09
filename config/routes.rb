Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/shops', to: 'shops#index'
end
