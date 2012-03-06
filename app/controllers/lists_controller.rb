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

  # GET /list/new
  # GET /list/new.xml
  def new
    @list = List.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @list }
    end
  end
  
  
end
