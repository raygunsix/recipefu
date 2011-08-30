require "spec_helper"

feature "Recipes", %q{
  In order to plan my meals
  As an user
  I want to create and manage recipes
} do

  before(:each) do
    @recipe = Factory.build(:recipe, :user_id => 1)
    @step = Factory.build(:step, :recipe_id => 1)
  end

  scenario "list recipes" do
    @recipe.save
    visit "/recipes"
    page.should have_content(@recipe.title)
  end

  scenario "show a recipe" do
    @recipe.save
    @step.save
    visit "/recipes/" + @recipe.id.to_s
    page.should have_content(@recipe.title)
    page.should have_content(@step.instructions)
  end

  scenario "add a new recipe" do
    login_with_oauth
    visit "/recipes/new"
    fill_in "Title", :with => @recipe.title
    fill_in "Description", :with => @recipe.description
    fill_in "Step", :with => @step.instructions
    click_on "Create Recipe"
    page.should have_content(@recipe.title)
    page.should have_content("Recipe was successfully created.")
  end

  scenario "edit a recipe" do
    @recipe.save
    login_with_oauth
    visit "/recipes/" + @recipe.id.to_s + "/edit"
    fill_in "Title", :with => "Rabbit Stew"
    fill_in "Description", :with => "This is the best stew ever"
    click_on "Update Recipe"
    page.should have_content("Rabbit Stew")
    page.should have_content("Recipe was successfully updated.")
  end

  scenario "delete a recipe step" do
    @recipe.save
    @step.save
    login_with_oauth
    visit "/recipes/" + @recipe.id.to_s + "/edit"
    click_link "remove"
    click_on "Update Recipe"
    page.should have_content("Recipe was successfully updated.")
    page.should_not have_content("Rabbit Stew")
  end

  scenario "create a recipe" do
    login_with_oauth
    post_via_redirect "/recipes", {
      :title => @recipe.title, 
      :description => @recipe.description, 
      :step => @step.instructions
    }
    response.status.should be(200)
    #page.should have_content("Recipe was successfully created.")
  end

  scenario "should update an existing recipe" do
    @recipe.save
    login_with_oauth
    put_via_redirect "/recipes/" + @recipe.id.to_s, {
      :title => "Chicken Soup Extreme",
      :description => @recipe.description,
    }
    response.status.should be(200)
    #page.should have_content("Recipe was successfully updated.")
  end  

  scenario "should delete an existing recipe" do
    @recipe.save
    login_with_oauth
    delete_via_redirect "/recipes/" + @recipe.id.to_s
    page.should have_content("Chicken Soup")
  end

end