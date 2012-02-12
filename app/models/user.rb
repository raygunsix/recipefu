class User < ActiveRecord::Base
  validates :name, :presence => true
  validates :uid, :presence => true
  validates :provider, :presence => true
  validates :nickname, :presence => true, :uniqueness => true

  has_friendly_id :nickname, :use_slug => true
 
  has_many :recipes, :dependent => :destroy
  
  def self.create_with_omniauth(auth)  
    create! do |user|  
      user.provider = auth["provider"]  
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      # create nickname if not provided  
      if auth["user_info"]["nickname"]
        user.nickname = auth["user_info"]["nickname"]
      else
        user.nickname = auth["user_info"]["name"].gsub(/[^0-9A-Za-z]/, '').downcase
      end
      user.email = auth["user_info"]["email"] if auth["user_info"]["email"] 
      user.image = auth["user_info"]["image"] if auth["user_info"]["image"]    
    end  
  end
end
