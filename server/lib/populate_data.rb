module PopulateData
  
  
  def default
    [Map, Tile, Startunit, RallyPoint, MapPoint].each(&:delete_all)
    small_map
    medium_map
    large_map
  end
  

  private
  def small_map
    i = Unit.find_by_name("Infantry");
    art = Unit.find_by_name("Artillery");
    arm = Unit.find_by_name("Armor");
    tile_types = ["Grass", "Rock"]
    
    small_map = Factory.create :map
    9.times do |t|
      Factory.create(:tile, :map_id => small_map.id, :map_order => t + 1, :height => rand(4) + 1, :tile_type => tile_types[rand(tile_types.length)])
    end
    Factory.create(:startunit, :map_id => small_map.id, :unit_id => i.id)
    1.times do
      map_rally_point = Factory.create(:MapPoint, :xpos => 0, :ypos => 0)
      Factory.create(:RallyPoint, :map_id => small_map.id, :map_point_id => map_rally_point.id )
    end
  end
  
  
  def medium_map
    i = Unit.find_by_name("Infantry");
    art = Unit.find_by_name("Artillery");
    arm = Unit.find_by_name("Armor");
    tile_types = ["Grass", "Rock"]
    
    human_start_point = MapPoint.create(:xpos => 0, :ypos => 0)
    ai_start_point = MapPoint.create(:xpos => 1, :ypos => 1)
    
    medium_map = Factory.create(:map, :name => "Medium", :height => 9, :width => 9)
    medium_map.human_start_point = human_start_point
    medium_map.ai_start_point = ai_start_point
    medium_map.save
    
    (medium_map.height * medium_map.width).times do |t|
      Factory.create(:tile,
                     :map_id => medium_map.id,
                     :map_order => t + 1,
                     :height => rand(4) + 1,
                     :tile_type => tile_types[rand(tile_types.length)])
    end
    3.times do
      map_rally_point = Factory.create(:MapPoint, :xpos => rand(medium_map.width), :ypos => rand(medium_map.height))
      Factory.create(:RallyPoint, :map_id => medium_map.id, :map_point_id => map_rally_point.id )
    end
    3.times do 
      Factory.create(:startunit, :map_id => medium_map.id, :unit_id => i.id)
    end
    3.times do 
      Factory.create(:startunit, :map_id => medium_map.id, :unit_id => art.id)
    end
    3.times do 
      Factory.create(:startunit, :map_id => medium_map.id, :unit_id => arm.id)
    end
    
  end
  
  
  def large_map
    i = Unit.find_by_name("Infantry");
    art = Unit.find_by_name("Artillery");
    arm = Unit.find_by_name("Armor");
    tile_types = ["Grass", "Rock"]
    
    large_map = Factory.create(:map, :name => "Large", :height => 20, :width => 20)
    (large_map.height * large_map.width).times do |t|
      Factory.create(:tile, :map_id => large_map.id, :map_order => t + 1, :height => rand(4) + 1, :tile_type => tile_types[rand(tile_types.length)])
    end
  end

end