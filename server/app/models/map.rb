class Map < ActiveRecord::Base
  has_many :tiles, :order => "map_order ASC"
  has_many :startunits
  has_many :rally_points, :class_name => "RallyPoint", :foreign_key => "map_id"
  belongs_to :human_start_point, :class_name => "MapPoint", :foreign_key => "human_start_point_id"
  belongs_to :ai_start_point, :class_name => "MapPoint", :foreign_key => "ai_start_point_id"
  
  
  def ra_star_map
    RaStar::map.new(width, height)
  end
  
  
end
