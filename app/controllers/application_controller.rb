class ApplicationController < ActionController::Base
#  before_filter :authorize
  protect_from_forgery
  helper_method :logined?, :current_user

  protected

  def current_user
    @current_user ||= login_from_session unless defined?(@current_user)
    @current_user
  end
 def logined?
    !!current_user
  end

  def login_from_session
    if session[:user_id].present?
      begin
        User.find(session[:user_id])
      rescue
        session[:user_id] = nil
      end
    end
  end

  def require_login
    @name = params[:name]
    @password = params[:password]
  end

  def login_as(user)
    session[:user_id] = user.id
    @current_user = user
  end
  
  private

  def authorize
    unless logined?
      redirect_to login_url, :notice => "Please Log In"
    end
  end
  
  
end
