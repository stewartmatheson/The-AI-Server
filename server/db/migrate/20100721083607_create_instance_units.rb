class CreateInstanceUnits < ActiveRecord::Migration
  def self.up
    create_table :instance_units do |t|
      t.integer :match_id
      t.integer :unit_id

      t.timestamps
    end
  end

  def self.down
    drop_table :instance_units
  end
end
