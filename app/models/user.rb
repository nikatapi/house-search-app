class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  
  has_many :houses,  dependent: :destroy
  #has_many :searches, dependent: :destroy
  has_many :reservations, dependent: :destroy
  acts_as_messageable

  #extend FriendlyId
  #friendly_id :email
  def mailboxer_email(object)
    return email
  end
 
  def feed
    #A preliminary feed for the profile page
    House.where("user_id = ?", id)
  end

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   
      user.remote_avatar_url = auth.info.image.gsub('http://','https://')
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end