class CreateSteps < ActiveRecord::Migration
  def self.up
    create_table :steps do |t|
      t.integer :recipe_id
      t.integer :step
      t.string :instructions

      t.timestamps
    end
  end

  def self.down
    drop_table :recipe_steps
  end
end
