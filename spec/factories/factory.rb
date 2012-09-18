# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	
  factory :user do
    provider "twitter"
    uid "0000"
    name "Guy Lafleur"
    nickname "guylafleur"
    email "guy@example.com"
    image "http://example.com/image.jpg"
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
    quantity 1.5
    size "pot"
  end

  factory :ingredient do
    name "water"
  end

  # factory :list do
  #   ingredient1 "3 cups chicken stock"
  #   ingredient2 "1 onion"
  #   ingredient3 "1 bunch bananas"
  # end

end
