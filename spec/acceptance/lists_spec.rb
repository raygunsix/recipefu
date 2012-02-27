require "spec_helper"

feature "Lists", %q{
  In order to easily cook meals 
  As an user
  I want to see the list of ingredients required 
} do

  before(:each) do
    @recipe = Factory.build(:recipe)
    @ingredient = Factory.build(:ingredient)
    @amount = Factory.build(:amount)

    OmniAuth.config.add_mock(:twitter, {
      :uid => @recipe.user.uid,
      :user_info => {
      :name => @recipe.user.name,
      :nickname => @recipe.user.nickname,
      :image => @recipe.user.image}
    })

  end

  scenario "show a list" do
    login_with_oauth
    @recipe.ingredients << @ingredient
    @recipe.amounts << Factory(:amount, :ingredient_id => Factory(:ingredient))
    @recipe.save
    REDIS.sadd(@recipe.user.nickname + "_list",
               @recipe.amounts[0].size.to_s + " " + @recipe.amounts[0].quantity.to_s + " " + @recipe.amounts[0].ingredient.name)
    visit "/" + @recipe.user.nickname + "/list/"
    page.should have_content(@recipe.amounts[0].ingredient.name)
  end

  # scenario "add a new list" do
  #   login_with_oauth
  #   visit "/guylafleur/list/new"
  #   fill_in "Ingredient", :with => @ingredient.name
  #   click_on "Create List"
  #   page.should have_content(@amount.quantity)
  #   page.should have_content(@amount.size)
  #   page.should have_content(@ingredient.name)
  #   page.should have_content("List was successfully created.")
  # end

  # scenario "create a recipe" do
  #   login_with_oauth
  #   post_via_redirect "/guylafleur/recipes", {
  #     :title => @recipe.title, 
  #     :description => @recipe.description, 
  #     :instructions => @recipe.instructions,
  #     :quantity => @amount.quantity,
  #     :size => @amount.size,
  #     :ingredient => @ingredient.name
  #   }
  #   response.status.should be(200)
  #   #page.should have_content("Recipe was successfully created.")
  # end

# test that previous list is being over written

end
