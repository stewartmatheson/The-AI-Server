class CreateTiles < ActiveRecord::Migration
  def self.up
    create_table :tiles do |t|
      t.integer :map_id
      t.string :tile_type
      t.integer :height
      t.integer :map_order
      t.boolean :deployment_zone, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :tiles
  end
end