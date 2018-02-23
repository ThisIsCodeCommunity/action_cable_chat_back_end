Rails.application.routes.draw do

  get 'messages/create'

  resources :chat_rooms, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end

  root controller: :chat_rooms, action: :index
end
