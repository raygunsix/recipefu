class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :steps, :dependent => :destroy
end
