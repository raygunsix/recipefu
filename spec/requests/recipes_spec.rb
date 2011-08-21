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

  # requires javascript?
  # describe "GET /recipes/new" do
  #   it "should list all recipes" do
  #     get "/recipes/new"
  #     fill_in "Title", :with => "Rabbit Stew"
  #     fill_in "Description", :with => "This is the best stew ever"
  #     click_button "Create Recipe"
  #     response.body.should have_content("Recipe was successfully created.")
  #   end
  # end  
  
end
