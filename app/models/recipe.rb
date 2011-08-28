class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :steps, :dependent => :destroy
  accepts_nested_attributes_for :steps
end
