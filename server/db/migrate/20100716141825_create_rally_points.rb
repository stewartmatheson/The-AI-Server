class CreateRallyPoints < ActiveRecord::Migration
  def self.up
    create_table :rally_points do |t|
      t.integer :map_id
      t.integer :map_point_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rally_points
  end
end
