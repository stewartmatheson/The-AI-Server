class CreateTurns < ActiveRecord::Migration
  def self.up
    create_table :turns do |t|
      t.integer :match_id
      t.integer :order
      t.integer :turn_counter, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :turns
  end
end
