class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :first
      t.integer :second
      t.string :relationship_type

      t.timestamps
    end
  end

  def self.down
    drop_table :relationships
  end
end
