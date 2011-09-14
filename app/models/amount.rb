class Amount < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  
  # Need these methods to prevent saving duplicate amounts records
  # http://stackoverflow.com/questions/3579924/accepts-nested-attributes-for-with-find-or-create
  
  def ingredient_name
    ingredient && ingredient.name
  end

  def ingredient_name=(name)
    self.ingredient = Ingredient.find_or_create_by_name(name) unless name.blank?
  end
  
end
