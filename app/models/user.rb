class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:facebook]

  def self.find_or_create_by_facebook_oauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first

    unless user
      user = User.create!(
            provider: auth.provider,
            uid: auth.uid,
            email: auth.info.email,
            first_name: auth.info.first_name,
            last_name: auth.info.last_name,
            access_token: auth.credentials.token,
            password: Devise.friendly_token[0, 20],
      )
      graph = Koala::Facebook::API.new(user.access_token)
      user_data = graph.get_object('me', fields: ['birthday', 'location', 'gender'])
      debugger
      user.create_profile!(
            birthday: user_data['user_birthday'],
            location: user_data['user_location'],
            gender: user_data['gender']
      )
      user
    end
  end

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :provider, :uid, :access_token

  has_one :profile


  def full_name
      "#{first_name} #{last_name}"
  end
end
