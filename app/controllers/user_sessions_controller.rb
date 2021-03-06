class UserSessionsController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create]

  def new
    user = User.new
  end
  def create
    if user = User.authenticate(params[:name],params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "User#{user.id} was logged in"
    else
      redirect_to login_url

  end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "User has logged out"
  end
  
end
