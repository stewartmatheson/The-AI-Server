# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100712152309) do

  create_table "map_points", :force => true do |t|
    t.integer  "xpos"
    t.integer  "ypos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", :force => true do |t|
    t.string   "name"
    t.integer  "height"
    t.integer  "width"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", :force => true do |t|
    t.string   "player_ip"
    t.integer  "user_id"
    t.integer  "map_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "moves", :force => true do |t|
    t.integer  "turn_id"
    t.string   "unit_type"
    t.integer  "start_point_id"
    t.integer  "end_point_id"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "startunits", :force => true do |t|
    t.integer  "map_id"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tiles", :force => true do |t|
    t.integer  "map_id"
    t.string   "tile_type"
    t.integer  "height"
    t.integer  "map_order"
    t.boolean  "deployment_zone", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turns", :force => true do |t|
    t.integer  "match_id"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.integer  "attack"
    t.integer  "defence"
    t.integer  "movement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
