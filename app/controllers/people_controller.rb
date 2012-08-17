class PeopleController < ApplicationController
  before_filter :find_person

  def show

    @photos = @person.photos.order_by([[:created_at, :desc]])
    @photos_count = @person.photos.count
  end

  protected

  def find_person
    #ignore the form of letters
    @person = User.find_by(name:/^#{params[:name]}$/i)
    raise Mongoid::Errors::DocumentNotFound.new(User, params[:name]) if @person.nil?
  end
end
