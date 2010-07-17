class RallyPoint < ActiveRecord::Base
  belongs_to :map_point, :class_name => "MapPoint", :foreign_key => "map_point_id"
end
