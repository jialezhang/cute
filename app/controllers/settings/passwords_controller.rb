class Settings::PasswordsController < ApplicationController
  before_filter :authorize
#  layout 'settings'

  def show
   @current_user = current_user
  end

  def update
    @current_user = current_user
   if @current_user.update_attributes params[:user]
     flash[:success] = 'Successful Update.'
     redirect_to root_url, :notice => "password has been successfully changed"
   else
     render :show
   end
  end
end
