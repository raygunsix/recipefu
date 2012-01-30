class StaticController < ApplicationController

  def index
    @profiles = User.find(:all, :limit => 3) 
  end

end
