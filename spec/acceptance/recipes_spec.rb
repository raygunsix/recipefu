require "spec_helper"

feature "Recipes", %q{
  In order to plan my meals
  As an user
  I want to
} do

  before(:each) do
    @recipe = Factory.build(:recipe)
    @ingredient = Factory.build(:ingredient)
    @amount = Factory.build(:amount)

    OmniAuth.config.add_mock(:twitter, {
      :uid => @recipe.user.uid,
      :user_info => {
      :name => @recipe.user.name,
      :nickname => @recipe.user.nickname}
    })

  end

  scenario "list recipes" do
    @recipe.save
    visit "/guylafleur/recipes"
    page.should have_content(@recipe.title)
  end

  scenario "show a recipe" do
    @recipe.ingredients << @ingredient
    @recipe.amounts << Factory(:amount, :ingredient_id => Factory(:ingredient))
    @recipe.save
    visit "/guylafleur/recipes/" + @recipe.cached_slug
    page.should have_content(@recipe.title)
    page.should have_content(@recipe.instructions)
    page.should have_content(@recipe.amounts[0].size)
    page.should have_content(@recipe.ingredients[0].name)
  end

  scenario "add a new recipe" do
    login_with_oauth
    visit "/guylafleur/recipes/new"
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
    visit "/guylafleur/recipes/" + @recipe.cached_slug + "/edit"
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
    post_via_redirect "/guylafleur/recipes", {
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

  scenario "update an existing recipe" do
    @recipe.save
    login_with_oauth
    put_via_redirect "/guylafleur/recipes/" + @recipe.cached_slug, {
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

  scenario "delete an existing recipe" do
    @recipe.save
    login_with_oauth
    delete_via_redirect "/guylafleur/recipes/" + @recipe.cached_slug
    visit "/guylafleur/recipes"
    page.should have_content("Chicken Soup")
  end

end
