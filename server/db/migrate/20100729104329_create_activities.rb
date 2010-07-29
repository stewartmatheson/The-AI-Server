class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer :game_unit_id
      t.integer :map_point_id
      t.boolean :active, :default => true
      t.integer :rule_id
      t.integer :phase, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
