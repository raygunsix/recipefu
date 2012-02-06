class ChangeAmountsDataType < ActiveRecord::Migration
  def self.up
    change_column :amounts, :quantity, :decimal
  end

  def self.down
    change_column :amounts, :quantity, :integer
  end
end
