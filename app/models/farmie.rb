class Farmie < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook, :twitter]
  validates_presence_of :first_name, :last_name
  validates :email, presence: true, length: { maximum: 255 }

  def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |member|
	    member.email = auth.user_info.email
	    member.password = Devise.friendly_token[0,20]
	    member.first_name = auth.user_info.first_name
	    member.last_name = auth.user_info.last_name
	  end
	end

end
