class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.string :player_ip
      t.integer :user_id
      t.integer :map_id
      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
