class HomeController < ApplicationController
  def index
    @user = current_user
    @photos = Photo.order_by([[:created_at, :desc]]).limit(20)
  end
end
