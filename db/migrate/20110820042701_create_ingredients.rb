class CreateIngredients < ActiveRecord::Migration
  def self.up
    create_table :ingredients do |t|
      t.name :string
      t.description :string

      t.timestamps
    end
  end

  def self.down
    drop_table :ingredients
  end
end
