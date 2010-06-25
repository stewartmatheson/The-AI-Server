class CreateStartunits < ActiveRecord::Migration
  def self.up
    create_table :startunits do |t|
      t.integer :map_id
      t.integer :unit_id

      t.timestamps
    end
  end

  def self.down
    drop_table :startunits
  end
end
