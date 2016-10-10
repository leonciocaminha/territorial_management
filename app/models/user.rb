class User < ActiveRecord::Base
  devise :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  def self.find_or_create_for_ctigi_auth_oauth(oauth_data)
    user = where(ctigi_auth_uid: oauth_data.uid).first_or_initialize
    user.first_name = oauth_data.info.first_name
    last_name = oauth_data.info.last_name
    user.email = oauth_data.info.email
    user.ctigi_auth_access_token = oauth_data.credentials.token
    user.avatar_url = oauth_data.info.avatar_full_path
    user.save

    return user
  end
end
