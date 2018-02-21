class ChatRoomsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :set_nickname
  before_action :get_nickname, only: :index

  def index
    if !@nickname.nil?
      @chat_rooms = ChatRoom.all
    else

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
