class ChatRoomsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  before_action :get_nickname, only: [:index, :show]

  def index
    @chat_rooms = ChatRoom.all if @nickname

    respond_to do |format|
      format.html
      format.json  do
        render json: @chat_rooms.as_json
      end
    end
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
  end

  def create
    if params[:nickname]
      cookies.permanent[:nickname] = params[:nickname]
      render json: {nickname: session[:nickname]}
    elsif params[:chat_room]
      chat_room = ChatRoom.find_or_create_by(chat_room_params)
      redirect_to chat_room_path(chat_room)
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:host, :title)
  end


end
