namespace :populate do
  desc "Populate the database with the 3 basic maps"
  task :all => :environment do
    
    i = Unit.find_by_name("Infantry");
    art = Unit.find_by_name("Artillery");
    arm = Unit.find_by_name("Armor");
    
    [Map, Tile, Startunit, RallyPoint, MapPoint].each(&:delete_all)

    tile_types = ["Grass", "Rock"]

    small_map = Factory.create :map
    9.times do |t|
      Factory.create(:tile, 
                     :map_id => small_map.id, 
                     :map_order => t + 1, 
                     :height => rand(4) + 1,
                     :tile_type => tile_types[rand(tile_types.length)])
    end
    Factory.create(:startunit, :map_id => small_map.id, :unit_id => i.id)
    
    1.times do
      map_rally_point = Factory.create(:MapPoint, :xpos => 0, :ypos => 0)
      Factory.create(:RallyPoint, :map_id => small_map.id, :map_point_id => map_rally_point.id )
    end
    
    
    medium_map = Factory.create(:map, :name => "Medium", :height => 9, :width => 9)
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
    
    large_map = Factory.create(:map, :name => "Large", :height => 20, :width => 20)
    (large_map.height * large_map.width).times do |t|
      Factory.create(:tile,
                     :map_id => large_map.id,
                     :map_order => t + 1,
                     :height => rand(4) + 1,
                     :tile_type => tile_types[rand(tile_types.length)])
    end
  end
end