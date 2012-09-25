class Photo
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  
  field :name, type: String
 # field :tag, type: Array
  field :content, type: String
  field :description, type: String
  field :actived_at, type: Time
  field :liker_ids, type: Array, default: []
  # field :replies_

  belongs_to :user
#  has_many   :replies, :dependent => :delete
  
  validates :content, :name, :user, :presence => true

  mount_uploader :content, UpphotosUploader

  before_create :set_actived_at

   def set_actived_at
    self.actived_at = Time.now.utc
   end

   def update_like_status_by(like)
     self.actived_at = like.create_at
     save
   end

   def reset_like_status
     last_like = likes.order([:create_at]).last
     if last_like
       update_like_status_by(last_like)
     else
       self.actived_at = created_at
       save
     end
   end

   def like_by(user)
     unless liked_by?(user) || self.user == user
       collection.update(
                  {:_id => self.id},
                  {"$AddToSet" => {:liker_ids => user.id}}
                  )
     end
   end
   def liked_by?(user)
     liker_ids.include?user.id
   end
end
