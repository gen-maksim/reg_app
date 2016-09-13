class SessionsController < ApplicationController
  skip_before_action :is_authenticated, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_studnum(params[:studnum])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => "Logged out!"
  end
end
