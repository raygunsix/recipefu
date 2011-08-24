# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	
	factory :user do
	  provider "twitter"
	  uid "0000"
	  name "Guy Lafleur"
  end
	
  factory :recipe do
    title "Chicken Soup"
    description "Mom's chicken soup recipe. It was my favorite when I was 12."
  end
  
end