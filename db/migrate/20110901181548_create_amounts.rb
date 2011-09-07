class CreateAmounts < ActiveRecord::Migration
  def self.up
    create_table :amounts do |t|
      t.integer :quantity
      t.string :size
      t.integer :recipe_id
      t.integer :ingredient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :amounts
  end
end
