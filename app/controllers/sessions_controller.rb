class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session.clear
    @current_user = nil
    redirect_to root_path
  end
end
