class ChatRoomsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :set_nickname
  before_action :get_nickname, only: :index

  def index
    @chat_rooms = ChatRoom.all if @nickname
  end

  def show
  end

  def set_nickname
    cookies.permanent[:nickname] = params[:nickname]
    render json: {nickname: session[:nickname]}
  end

  private

  def get_nickname
    @nickname = cookies.permanent[:nickname]
  end
end
