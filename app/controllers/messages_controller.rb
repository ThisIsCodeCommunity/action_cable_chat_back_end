class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    chat_room = ChatRoom.find(params[:chat_room_id])
    message = chat_room.messages.create(message_params)
    if message.persisted?
      # Send using AC
      ActionCable.server.broadcast "chat_room_channel_#{chat_room.id}",
                                   {room_id: chat_room.id,
                                   sender: message.sender,
                                   message: message.body}
      # Send feedback using json?
      render json: {message: 'Your message was sent...'}
    end
  end


  private

  def message_params
    params.require(:message).permit(:sender, :body)
  end
end
