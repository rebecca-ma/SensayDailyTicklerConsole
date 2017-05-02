Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'console#index'

  get '/index', to: 'console#index', as: 'console'
  get '/change/:date', to: 'console#change_message', as: 'change'
  post '/change/:date', to: 'console#set_message'
  delete '/delete/:date', to: 'console#destroy', as: 'delete'
  delete '/delete_range/:date',
         to: 'console#destroy_range',
         as: 'delete_range'
end
