class HomeController < ApplicationController
  before_filter :authorize
  def index
    @user = current_user
    @photos = Photo.order_by([[:created_at, :desc]]).limit(20)
#    @photos_own = Photo.find_by(user_id:current_user.id).to_a
  end

#  protected

#  def find_own_photos
#    @photos_own = Photo.find(user_id:current_user)
#    
#  end
end
