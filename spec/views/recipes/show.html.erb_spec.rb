require 'spec_helper'

describe "recipes/show.html.erb" do
  before(:each) do
    @recipe = assign(:recipe, stub_model(Recipe,
      :string => "",
      :string => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
