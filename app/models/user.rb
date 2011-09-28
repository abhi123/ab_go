class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
  # Setup accessible (or protected) attributes for your model
  #attr_accessible :first_name, :last_name,:email, :password, :password_confirmation, :remember_me, :identifier, :access_token
  has_one :facebook
  has_many :comments
  has_many :albums
  has_many :jtags
  has_many :friends
  has_many :friend_requests
  has_many :messages
  self.per_page = 2
  accepts_nested_attributes_for :albums
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  # Start Tagg section
  acts_as_taggable
  acts_as_taggable_on :skills, :interests
  # End Tag section
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    token = access_token['credentials']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      User.create(:identifier => data["id"], :access_token => token["token"], :first_name => data["first_name"], :last_name => data["last_name"], :email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end
  
  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token['user_info']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password.
      User.create(:first_name => data["first_name"], :last_name => data["last_name"], :email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end

end
