class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth, user)
    user = User.find_by(email: user.email)
    user.update(provider: auth.provider, uid: auth.uid, facebook_access_token: auth.credentials.token)
    user
  end
end
