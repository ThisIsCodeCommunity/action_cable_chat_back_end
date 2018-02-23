class MessagesController < ApplicationController
  def create
    chat_room = ChatRoom.find(params[:chat_room_id])
    binding.pry
    message = chat_room.messages.create(message_params)
    if message.persisted?
      # Send using AC
      # Send feedback using json?
      render json: {message: 'Your message was sent...'}
    end
  end


  private

  def message_params
    params.require(:message).permit(:sender, :body)
  end
end
