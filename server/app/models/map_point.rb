class MapPoint < ActiveRecord::Base
  
  
  def ra_star_node
    RaStar::Node.new(xpos, ypos)
  end
  
  
end
