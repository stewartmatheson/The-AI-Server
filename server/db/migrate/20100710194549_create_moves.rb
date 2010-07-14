class CreateMoves < ActiveRecord::Migration
  def self.up
    create_table :moves do |t|
      t.integer :turn_id
      t.string :unit_type
      t.integer :start_point_id
      t.integer :end_point_id
      t.integer :unit_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :moves
  end
end
