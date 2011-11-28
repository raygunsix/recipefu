require 'spec_helper'

describe RecipesController do
  describe "routing" do

    before(:each) do
      @recipe = Factory.build(:recipe)
      @user = Factory.build(:user)
    end

    it '/:recipe_id/new to Recipes#new' do
      path = new_user_recipe_path('guylafleur')
      path.should == '/guylafleur/recipes/new'
      { :get => path }.should route_to(
        :controller => 'recipes',
        :action => 'new',
        :user_id => 'guylafleur'
      )
    end

    it '/:user_id/:recipe_id to Recipes#show' do
      path = user_recipe_path 'guylafleur', 'chicken-soup'
      path.should == '/guylafleur/recipes/chicken-soup'
      { :get => path }.should route_to(
        :controller => 'recipes',
        :action => 'show',
        :user_id => 'guylafleur',
        :id => 'chicken-soup'
      )
    end

    it '/:user_id/:recipe_id/edit to Recipes#edit' do
      path = edit_user_recipe_path 'guylafleur', 'chicken-soup'
      path.should == '/guylafleur/recipes/chicken-soup/edit'
      { :get => path }.should route_to(
        :controller => 'recipes',
        :action => 'edit',
        :user_id => 'guylafleur',
        :id => 'chicken-soup'
      )
    end

  end
end
