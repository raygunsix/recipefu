class ListsController < ApplicationController
  
  # GET /list
  # GET /list.xml
  def show
    @list = REDIS.smembers(params[:user_id] + "_list")
    
    #render :text => REDIS.smembers(params[:user_id] + "_list")
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ingredients }
    end
  end

  
  
end
