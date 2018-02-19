class ChatRoomsController < ApplicationController
  before_action :get_nickname
  def index
    if @nickname
      @chat_rooms = ChatRoom.all
    end
  end

  def show
  end

  def set_nickname
    session[:nickname] = params[:nickname]
    render json: {nickname: session[:nickname]}
  end

  private

  def get_nickname
    @nickname = session[:nickname]
  end
end
