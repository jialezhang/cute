class UsersController < ApplicationController
  skip_before_filter :authorize
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  def create
    @user = User.new(params[:user])

      if @user.save
#        login_as @user
        redirect_to login_path
      else
        render :new
      end
  end
end
