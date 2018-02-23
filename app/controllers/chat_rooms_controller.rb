class ChatRoomsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  before_action :get_nickname, only: [:index, :show]

  def index
    @chat_rooms = ChatRoom.all if @nickname
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
  end

  def create
    if params[:nickname]
      cookies.permanent[:nickname] = params[:nickname]
      render json: {nickname: session[:nickname]}
    elsif params[:room]
      ChatRoom.find_or_create_by(title: params[:room]) do |room|
        room.host = @nickname
      end
    end


  end


end
