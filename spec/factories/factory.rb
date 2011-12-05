# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	
  factory :user do
    provider "twitter"
    uid "0000"
    name "Guy Lafleur"
    nickname "guylafleur"
    cached_slug "guylafleur"
  end
	
  factory :recipe do
    title "Chicken Soup"
    description "Mom's chicken soup recipe. It was my favorite when I was 12."
    instructions "Boil water and then turn on oven. Ready when smoke alarm sound."
    cached_slug "chicken-soup"
    association :user, :factory => :user
  end

  factory :amount do
    quantity 1
    size "pot"
  end

  factory :ingredient do
    name "water"
  end

end
