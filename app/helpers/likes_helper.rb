#conding: utf-8
module LikesHelper
  def like_tag(photol, opts ={})
    return "" if photol.blank?

    if current_user && photol.liked_by?(current_user)
      status = "liked"
      icon = content_tag("div", "", :class => status)
    else
      status = "like"
      icon = content_tag("div", "", :class => status)
    end

     body = raw "#{icon}"
    # url = "#"
    # html = {:class => "photol", :rel => "twipsy",:onclick => "return App.like(this); ",
    #   'data-id' => photol.id,'data-status' => status}
    # link_to body,url,html
    link_to body, "#", :onclick => "return App.like(this);", 'data-status' => status, :class => "photol", 'data-id' => photol.id
   
  end
end
  



