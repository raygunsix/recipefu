class AddInstructionsToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :instructions, :text
  end

  def self.down
    remove_column :recipes, :instructions
  end
end
