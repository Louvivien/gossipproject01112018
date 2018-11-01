class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :set_current_user

  private

  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      puts "voici le nom de ma session"
      puts @current_user
    end
  end

end
