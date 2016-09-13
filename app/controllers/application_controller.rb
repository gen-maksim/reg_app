class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :is_authenticated

  private
    def is_authenticated
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
      unless @current_user
        redirect_to login_url
      end
    end
end
