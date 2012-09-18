class ListsController < ApplicationController

  # GET /lists
  # GET /lists.xml
  def show
    @list = List.get(current_user.id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ingredients }
    end
  end

  # GET /lists/new
  # GET /lists/new.xml
  def new
    @list = List.new
    @titles = []
    recipe_titles = current_user.recipes.find(:all, :select => "title")

    recipe_titles.each do |t|
      puts @titles << t.title
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @list }
    end
  end

  # POST /lists
  # POST /lists.xml
  def create

    #@recipe = current_user.list.new(params[:recipe])

    render :text => params[:ingredients]

    #respond_to do |format|
      #if @recipe.save
        #format.html { redirect_to(user_lists_path(current_user.cached_slug, @recipe), :notice => 'Recipe was successfully created.') }
        #format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      #else
        #format.html { render :action => "new" }
        #format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      #end
    #end
  end

end
