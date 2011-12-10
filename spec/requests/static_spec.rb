require "spec_helper"

describe "Static Pages" do

  before(:each) do
    @recipe = Factory.build(:recipe)
    @ingredient = Factory.build(:ingredient)
    @amount = Factory.build(:amount)

    OmniAuth.config.add_mock(:twitter, {
      :uid => @recipe.user.uid,
      :user_info => {
      :name => @recipe.user.name,
      :nickname => @recipe.user.nickname},
    })

  end

  describe "GET /" do
    it "should show a logged in user a create new recipe link" do
      login_with_oauth
      visit root_path
      click_link "New Recipe"
      page.should have_content("New recipe")
    end

    it "should not show a logged out user a create new recipe link" do
      visit root_path
      page.should_not have_link("New Recipe")
    end

  end
end
