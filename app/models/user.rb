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
            picture: URI.parse(auth.info.image)
      )
      graph = Koala::Facebook::API.new(user.access_token)
      user_data = graph.get_object('me', fields: 'birthday, location, gender')

      bd_data = user_data['birthday'].split('/').map!(&:to_i)
      user.create_profile!(
            birthday: Date.new(bd_data[2], bd_data[0], bd_data[1]),
            location: user_data['location']['name'],
            gender: user_data['gender']
      )
    end
    user
  end

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :provider, :uid, :access_token,
                  :profile_attributes, :picture

  has_one :profile, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :profile

  has_many :projects, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :test_projects, through: :registrations, source: :project

  has_many :feedbacks
  has_many :choices, through: :feedbacks

  has_attached_file :picture, styles: { large: "200x200>",
                                        medium: "100x100>",
                                        thumb: "50x50>" },
                    default_url: "missing.png"


  def full_name
      "#{first_name} #{last_name}"
  end
end
