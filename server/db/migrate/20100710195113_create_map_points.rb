class CreateMapPoints < ActiveRecord::Migration
  def self.up
    create_table :map_points do |t|
      t.integer :xpos
      t.integer :ypos

      t.timestamps
    end
  end

  def self.down
    drop_table :map_points
  end
end
