class Recipe < ActiveRecord::Base
  
  attr_accessible :title, :description, :instructions, :amounts_attributes
  
  validates :title, :presence => true

  has_friendly_id :title, :use_slug => true, :scope => :user_id
  
  belongs_to :user
  has_many :amounts
  has_many :ingredients, :through => :amounts
  accepts_nested_attributes_for :amounts, :allow_destroy => true
  accepts_nested_attributes_for :ingredients
  
end
