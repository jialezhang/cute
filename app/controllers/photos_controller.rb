class PhotosController < ApplicationController
  before_filter :authorize
 def index
    @user = current_user
    @photos = Photo.order_by([[:created_at, :desc]]).limit(20)
#    @photos_own = Photo.find_by(user_id:current_user.id).to_a
  end
  def new
    #    @current_user = User.find(session[:user_id])
   @current_user = current_user
    @photo = Photo.new
  end

  def create
 #   @current_user = User.find(session[:user_id])
    @photo = current_user.photos.new(params[:photo])
    if @photo.save
      redirect_to root_url, :notice => "success upload photo!"
    end
    
  end

  def show
  end

  def edit
  end

  def update
  end
end
