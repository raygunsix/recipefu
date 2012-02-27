class ListsController < ApplicationController
  
  # GET /lists/1
  # GET /lists/1.xml
  def index
    @list = # get index array from redis

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ingredients }
    end
  end

  
  
end
