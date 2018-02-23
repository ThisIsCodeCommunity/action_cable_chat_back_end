class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def index
    @message = 'Welcome to this Scaffold'
    render html: '', layout: true
  end

  private

  def get_nickname
    @nickname = cookies.permanent[:nickname]
  end
end
