class CreateMaps < ActiveRecord::Migration
  def self.up
    create_table :maps do |t|
      t.string :name
      t.integer :height 
      t.integer :width
      t.integer :human_start_point_id
      t.integer :ai_start_point_id
      t.timestamps
    end
  end

  def self.down
    drop_table :maps
  end
end
