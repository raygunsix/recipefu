class RemoveSteps < ActiveRecord::Migration
  def self.up
    drop_table :steps
  end

  def self.down
    create_table :steps do |t|
      t.integer :recipe_id
      t.integer :step
      t.string :instructions

      t.timestamps
    end
  end
end
