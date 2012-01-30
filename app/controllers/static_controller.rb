class StaticController < ApplicationController

  def index
    @profiles = User.where("image IS NOT NULL")
  end

end
