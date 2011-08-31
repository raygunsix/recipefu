require 'spec_helper'

describe Recipe do
  
  it "should require a title" do
    recipe = Factory.build(:recipe, :title => "")
    recipe.should_not be_valid
  end
  
end
