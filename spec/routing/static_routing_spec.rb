require 'spec_helper'

describe StaticController do
  describe "routing" do

    before(:each) do
    end

    it '/ to Static#index' do
      path = root_path
      path.should == '/'
      { :get => path }.should route_to(
        :controller => 'static',
        :action => 'index'
      )
    end

  end
end
