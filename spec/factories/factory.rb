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

  factory :step do
    instructions "Boil water"
  end

  factory :amount do
    quantity 1
    size "pot"
  end

  factory :ingredient do
    name "water"
  end

end