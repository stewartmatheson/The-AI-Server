class CreateRules < ActiveRecord::Migration
  def self.up
    create_table :rules do |t|
      t.integer :order
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :rules
  end
end
