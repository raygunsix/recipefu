class User < ActiveRecord::Base
  validates :name, :presence => true
  validates :uid, :presence => true
  validates :provider, :presence => true
  validates :nickname, :presence => true
 
  has_many :recipes, :dependent => :destroy
  
  def self.create_with_omniauth(auth)  
    create! do |user|  
      user.provider = auth["provider"]  
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]  
      user.nickname = auth["user_info"]["nickname"]
    end  
  end
end
