class AddCachedSlugToRecipes < ActiveRecord::Migration
  def self.up
    add_column :recipes, :cached_slug, :string
    add_index :recipes, [:user_id, :cached_slug], :unique => true
  end

  def self.down
    remove_column :recipes, :cached_slug
  end
end
