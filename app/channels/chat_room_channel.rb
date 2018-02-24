class ChatRoomChannel < ApplicationCable::Channel

  def subscribed
    reject unless self.params[:room_id]
    id = self.params[:room_id]
    stream_from "chat_room_channel_#{id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def recieive

  end
end
