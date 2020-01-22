class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, :omniauth_providers => [:facebook,:google_oauth2]
  has_many :dishes
  ratyrate_rater
  has_many :reviews,dependent: :destroy
  mount_uploader :image, ImageUploader
  def self.new_with_session(params, session)
	  super.tap do |user|
	    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
	      user.email = data["email"] if user.email.blank?
	    end
	  end
	end
	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.name = auth.info.name    
	    user.image = auth.info.image  
	  end
	end
	def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    user
	end
end
