class Recipe < ActiveRecord::Base
  has_many :steps
end
