class User < ActiveRecord::Base

  has_many :machines
  has_many :drinks
  has_many :favorites
  has_many :favorite_drinks, :class_name => 'Drink', :through => :favorites
  has_many :coffee_types, :through => :drinks
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :rememberable, :token_authenticatable

  def self.find_for_manybots_oauth(access_token, signed_in_resource=nil)
    data = access_token['info']
    credentials = access_token['credentials']
    if user = User.find_by_manybots_user_id(access_token['uid'].to_s)
      user.update_attributes({:oauth_token => credentials['token'], :oauth_secret => credentials['secret'] })
      user
    else # Create a user with a stub password. 
      User.create! do |user|
        user.oauth_token = credentials['token']
        user.oauth_secret = credentials['secret']
        user.email = data['id'].to_s + '_' + data["email"].to_s
        user.name = data['name']
        user.manybots_user_id = data['id']
        user.manybots_avatar_url = data['image']
      end
    end
  end

  def oauth_client
    consumer ||= OAuth::Consumer.new(MANYBOTS_CONSUMER_KEY, MANYBOTS_CONSUMER_SECRET, {
      :site => MANYBOTS_URL
    })
    access_token = OAuth::AccessToken.new(consumer, self.oauth_token, self.oauth_secret)
  end
  
  
  def email_to_s
    @address ||= self.email.split('_')[1..-1].join('_')
  end

  def post_to_manybots!(activity)
    self.oauth_client.post("#{MANYBOTS_URL}/activities.json", {:version => "1.0", :activity => activity}.to_json, {'Content-Type' => 'application/json', 'Accept' => 'application/json'})
  end
  
end
