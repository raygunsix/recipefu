class Recipe < ActiveRecord::Base
  validates :title, :presence => true
  
  belongs_to :user
  has_many :steps, :dependent => :destroy
  has_many :amounts
  has_many :ingredients, :through => :amounts
  accepts_nested_attributes_for :steps, 
    :allow_destroy => true,
    :reject_if => lambda { |a| a[:instructions].blank? }
end
