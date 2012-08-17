  require 'bcrypt'
  require 'digest/sha2'
class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include Mongoid::Timestamps
  include BCrypt

#  has_secure_password
  
  field :name, type:String
  field :email, type:String
  field :hashed_password, type:String
  field :salt, type:String 
  field :avatar, type:String
  
  #field :access_token
  #field :locale, :default => I18n.locale.to_s
  
  has_many :photos
  embeds_one :profile
  
  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :name, :format => {:with => /\A\w+\z/, :message => 'only A-Z, a-z, _ allowed'}, :length => {:in => 3..20}
 # validates :email, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}
  validates :password, :password_confirmation, :presence => true, :on => :create
  validates :password, :length => {:minimum => 6, :allow_nil => true}
  validates_presence_of :avatar
  #  validates :current_password, :current_password => {:fields => [:name, :email, :password]}, :on => :update
  attr_reader :password
  attr_accessor :current_password, :password_confirmation
  attr_accessible :name, :password, :password_confirmation, :current_password, :avatar
  
  mount_uploader :avatar, UploadAvatarUploader
  
  before_create :build_profile


  def User.encrypt_password(password,salt)
    Digest::SHA2.hexdigest(password+"wibble"+salt)
  end

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password,salt)
    end
  end
  
  def User.authenticate(name,password)
    if user = User.find_by(name:name)
      if user.hashed_password == encrypt_password(password,user.salt)
        user
    end
    end
  end

  
  private
  def password_must_be_present
    errors.add(:password, "Missing password") unless hashed_password.present?
  end
  
end

 
