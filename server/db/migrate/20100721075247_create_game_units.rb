class CreateGameUnits < ActiveRecord::Migration
  def self.up
    create_table :game_units do |t|
      t.integer :match_id
      t.integer :unit_id
      t.string :player

      t.timestamps
    end
  end

  def self.down
    drop_table :game_units
  end
end
