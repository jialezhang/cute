class Settings::ProfilesController < ApplicationController
  before_filter :authorize
 # layout 'settings'

  def show
    @current_user = current_user
  end

  def update
    @current_user = current_user
   if @current_user.profile.update_attributes params[:profile]
      flash[:success] = 'Successful Update.'
      redirect_to root_url, :notice => "porfile has been successfully changed"
    else
      render :show
    end
  end
end
