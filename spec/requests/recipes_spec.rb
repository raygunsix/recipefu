require 'spec_helper'

describe "Recipes" do
  
  before(:each) do
    @recipe = Factory.build(:recipe)
  end
  
  describe "GET /recipes" do
    it "should list all recipes" do
      @recipe.save
      get "/recipes"
      response.body.should include(@recipe.title)
    end
  end
  
  describe "GET /recipes/id" do
    it "should list all recipes" do
      @recipe.save
      get "/recipes/" + @recipe.id.to_s
      response.body.should include(@recipe.title)
    end
  end

  # describe "GET /recipes/new" do
  #   it "should list all recipes",  :js => true do
  #     get "/recipes/new"
  #     fill_in "Title", :with => "Rabbit Stew"
  #     fill_in "Description", :with => "This is the best stew ever"
  #     click_button "Create Recipe"
  #     response.body.should have_content("Recipe was successfully created.")
  #   end
  # end  
  # 
  # describe "GET /recipes/id/edit" do
  #   it "should allow recipe to be edited" do
  #     @recipe.save
  #     get "/recipes/" + @recipe.id.to_s + "/edit"
  #     fill_in "Title", :with => "Rabbit Stew"
  #     fill_in "Description", :with => "This is the best stew ever"
  #     click_button "Update Recipe"
  #     response.body.should have_content("Recipe was successfully updated.")
  #   end
  # end
 
  describe "POST /recipes" do
    it "should create a new recipe" do
      post_via_redirect "/recipes", {:title => @recipe.title, :description => @recipe.description}
      response.body.should include("Recipe was successfully created.")
    end
  end 
  
  describe "PUT /recipes/id" do
    it "should update an existing recipe" do
      @recipe.save
      put_via_redirect "/recipes/" + @recipe.id.to_s, {:title => "Chicken Soup Extreme", :description => @recipe.description}
      response.body.should include("Recipe was successfully updated.")
    end
  end  
 
  describe "DELETE /recipes/id" do
    it "should delete an existing recipe" do
      @recipe.save
      delete_via_redirect "/recipes/" + @recipe.id.to_s
      response.body.should_not include("Chicken Soup")
    end
  end 
  
end
