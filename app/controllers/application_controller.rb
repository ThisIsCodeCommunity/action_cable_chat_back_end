class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def index
    @message = 'Welcome to this Scaffold'
    render html: '', layout: true
  end
end
