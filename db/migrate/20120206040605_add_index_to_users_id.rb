class AddIndexToUsersId < ActiveRecord::Migration
  change_table :users do |t|
    t.index :id, :unique => true
  end
end
