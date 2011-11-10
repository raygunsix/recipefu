require "spec_helper"

feature "Recipes", %q{
  In order to plan my meals
  As an user
  I want to
} do

  before(:each) do
    @recipe = Factory.build(:recipe, :user_id => 1)
    @amount = Factory.build(:amount, :recipe_id => 1)
    @ingredient = Factory.build(:ingredient)
  end

  scenario "list recipes" do
    @recipe.save
    visit "/recipes"
    page.should have_content(@recipe.title)
  end

  scenario "show a recipe" do
    @recipe.save
    @amount.save
    @ingredient.save
    visit "/recipes/" + @recipe.id.to_s
    page.should have_content(@recipe.title)
    page.should have_content(@recipe.instructions)
    page.should have_content(@amount.size)
    page.should have_content(@ingredient.name)
  end

  scenario "add a new recipe" do
    login_with_oauth
    visit "/recipes/new"
    fill_in "Title", :with => @recipe.title
    fill_in "Description", :with => @recipe.description
    fill_in "Instructions", :with => @recipe.instructions
    fill_in "Quantity", :with => @amount.quantity
    fill_in "Size", :with => @amount.size
    fill_in "Ingredient", :with => @ingredient.name
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
    fill_in "Instructions", :with => "Forget it. Order take out."
    #fill_in "Quantity", :with => 4
    click_on "Update Recipe"
    page.should have_content("Rabbit Stew")
    #page.should have_content("4")
    page.should have_content("Recipe was successfully updated.")
    page.should have_content("Forget it. Order take out.")
  end

  scenario "create a recipe" do
    login_with_oauth
    post_via_redirect "/recipes", {
      :title => @recipe.title, 
      :description => @recipe.description, 
      :instructions => @recipe.instructions,
      :quantity => @amount.quantity,
      :size => @amount.size,
      :ingredient => @ingredient.name
    }
    response.status.should be(200)
    #page.should have_content("Recipe was successfully created.")
  end

  scenario "should update an existing recipe" do
    @recipe.save
    login_with_oauth
    put_via_redirect "/recipes/" + @recipe.id.to_s, {
      :title => "Chicken Soup Extreme",
      :description => "So Extreme",
      :instructions => "Broil for 1 hour",
      :quantity => 8,
      :size => "gallons",
      :ingredient => "hot sauce"
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
