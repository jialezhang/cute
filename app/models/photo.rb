class Photo
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  
  field :name, type: String
 # field :tag, type: Array
  field :content, type: String
  field :description, type: String
  field :actived_at, type: Time

  belongs_to :user
#  has_many   :replies, :dependent => :delete
  
  validates :content, :name, :user, :presence => true

  mount_uploader :content, UpphotosUploader

  before_create :set_actived_at

   def set_actived_at
    self.actived_at = Time.now.utc
   end
   
end
