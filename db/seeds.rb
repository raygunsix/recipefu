# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Recipe.create([
  { :title => "Chicken Soup",
    :description => "Mom's chicken soup recipe. It was my favorite when I was 12."},
  { :title => "Fish Tacos",
    :description => "The key to this recipe is to drink a margarita while making it."}
])
