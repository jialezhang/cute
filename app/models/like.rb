class Like
  include Mongoid::Document
  field :photo_id, type: String
  field :likes_user_ids, type: Array, default: []
  # field :likes_count, type: Integer, default: 0

  # belongs_to :user
  belongs_to :photo
 
  def liked_by_user?(user)
    return false if user.blank?
    self.likes_user_ids.include?(user.id)
    
  end
end
