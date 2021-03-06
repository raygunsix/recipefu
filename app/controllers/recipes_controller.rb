class RecipesController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  # GET /recipes
  # GET /recipes.xml
  def index

    @user = User.find(params[:user_id])

    @recipes = Recipe.where(:user_id => @user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new
    
    @recipe.amounts.build
    @recipe.ingredients.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = current_user.recipes.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.xml
  def create

    @recipe = current_user.recipes.new(params[:recipe])

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to(user_recipe_path(current_user.cached_slug, @recipe), :notice => 'Recipe was successfully created.') }
        format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  def update
    @recipe = current_user.recipes.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to(user_recipe_path(current_user.id, @recipe), :notice => 'Recipe was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to(user_recipes_url) }
      format.xml  { head :ok }
    end
  end
end
