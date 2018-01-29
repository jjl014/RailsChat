Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    get 'chats/:username', to: 'chat#index'
    get 'chat/:id', to: 'chat#show'
    post 'chat', to: 'chat#create'
  end
end
