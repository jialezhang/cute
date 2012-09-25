class LikesController < ApplicationController
  before_filter :authorize
  
  def create
    photo = Photo.find(params[:id])
    if photo
      photo.push(:liker_ids, current_user.id)
    else
      redirect_to root_url, :notice =>"@like is  not successful build"
    end
  end
  
  def destroy
    photo = Photo.find(params[:id])
    photo.pull(:liker_ids, current_user.id)
  end
end
