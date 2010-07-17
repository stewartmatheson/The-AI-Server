class Map < ActiveRecord::Base
  has_many :tiles, :order => "map_order ASC"
  has_many :startunits
  has_many :rally_points, :class_name => "RallyPoint", :foreign_key => "map_id"
end
