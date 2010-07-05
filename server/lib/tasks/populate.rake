namespace :populate do
  desc "Populate the database with the 3 basic maps"
  task :maps => :environment do
    [Map, Tile].each(&:delete_all)

    tile_types = ["Grass", "Rock"]

    small_map = Factory.create :map
    9.times do |t|
      Factory.create(:tile, 
                     :map_id => small_map.id, 
                     :map_order => t + 1, 
                     :height => rand(4) + 1,
                     :tile_type => tile_types[rand(tile_types.length)])
    end
    
    medium_map = Factory.create(:map, :name => "Medium", :height => 9, :width => 9)
    (medium_map.height * medium_map.width).times do |t|
      Factory.create(:tile,
                     :map_id => medium_map.id,
                     :map_order => t + 1,
                     :height => rand(4) + 1,
                     :tile_type => tile_types[rand(tile_types.length)])
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