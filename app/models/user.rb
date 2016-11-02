class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
  validates :name, presence: true
  belongs_to :team
  has_many :questions
  has_many :seminars

  def self.find_for_facebook_oauth(access_token)
    user = User.where(:provider => access_token.provider, :uid => access_token.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else

        pwd=Devise.friendly_token[0,20]
        user = User.create(:provider => access_token.provider, :uid => access_token.uid,:email => access_token.info.email,:password => pwd, :confirmed_at => Date.today, :name => access_token.info.name )
        # user.generate_authentication_token!
         user.save(validate:false)
         return user
        # UserMailer.user_registration_mail(user).deliver!
        #sign_in_and_redirect @user, :event => :authentication
    
      end
    end
  end
end
