require 'spec_helper'

describe "recipes/new.html.erb" do
  before(:each) do
    assign(:recipe, stub_model(Recipe,
      :string => "",
      :string => ""
    ).as_new_record)
  end

  it "renders new recipe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recipes_path, :method => "post" do
      assert_select "input#recipe_string", :name => "recipe[string]"
      assert_select "input#recipe_string", :name => "recipe[string]"
    end
  end
end
