Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :api, defaults: {format: :json} do
  # end
  get 'chats/:username', to: 'chat#index', as: 'chats'
  get 'chat/:id', to: 'chat#show', as: 'chat'
  post 'chat', to: 'chat#create', as: 'create_chat'
end
