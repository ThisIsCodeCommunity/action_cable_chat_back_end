Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  resources :chat_rooms, only: [:index, :show]
  post :set_nickname, controller: :chat_rooms, action: :set_nickname

  root controller: :chat_rooms, action: :index
end
