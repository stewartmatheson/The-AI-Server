class Move < ActiveRecord::Base
  belongs_to :turn
  belongs_to :start_point, :class_name => "MapPoint", :foreign_key => "start_point_id"
  belongs_to :end_point, :class_name => "MapPoint", :foreign_key => "end_point_id"
end
