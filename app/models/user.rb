class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :first_name, :last_name, :picture, :address_city, :address_street, :adress_zip, :telephone, :fax, :mobile, :gender
  # attr_accessible :title, :body

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    extra = access_token.extra.raw_info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create(first_name: data["first_name"],
                         last_name: data["last_name"],
                         email: data["email"],
                         password: Devise.friendly_token[0,20],
                         picture: data["image"],
                         gender: extra["gender"],
                         provider: "google",
                         uid: extra["id"]
      )
    end
    user
  end

end

