class Recipe < ActiveRecord::Base
  validates :title, :presence => true
  
  belongs_to :user
  has_many :steps, :dependent => :destroy
  accepts_nested_attributes_for :steps, 
    :allow_destroy => true,
    :reject_if => lambda { |a| a[:instructions].blank? }
end
