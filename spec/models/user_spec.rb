require 'spec_helper'

describe User do
  
  context "validations" do
  
    it "should require a name" do
      user = Factory.build(:user, :name => "")
      user.should_not be_valid
    end
  
    it "should require a provider" do
      user = Factory.build(:user, :provider => "")
      user.should_not be_valid
    end
  
    it "should require a uid" do
      user = Factory.build(:user, :uid => "")
      user.should_not be_valid
    end
  
  end
  
  describe "#create_with_omniauth" do
    it "should exist" do
      User.should respond_to(:create_with_omniauth)
    end
    
    context "with valid auth data" do
      
      before(:each) do
        @valid_auth = {
            "provider"=>"twitter",
            "appid"=>"196297497094752",
      			"app_secret" => "f2gt66yh4ed75dbd498752j87fdee013", 
      			"uid"=>"54321", 
            "user_info"=> {
      					"name"=>"Test User"
      				}
        }
      end
      
      it "should create a user with the correct data" do
        user = User.create_with_omniauth(@valid_auth)
        user.provider.should == @valid_auth["provider"]  
        user.uid.should == @valid_auth["uid"]  
        user.name.should == @valid_auth["user_info"]["name"]
      end
    end
    
  end
end