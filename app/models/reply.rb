class Reply
  include Mongoid::Document
  include Mongoid::Timestamps

  filed :content
  filed :mentioned_user_ids, :type => Array, :default => []

  belongs_to :user
  belongs_to :photo

  validates :content, :user, :photo, :presence => true
  after_create :update_photo
  after_destroy :reset_photo

  attr_accessible :content

  def update_photo
    photo.update_reply_stats_by(self)
    photo.reply_by user
  end
  def reset_photo
    photo.reset_reply_stats
    photo.
  end
end
