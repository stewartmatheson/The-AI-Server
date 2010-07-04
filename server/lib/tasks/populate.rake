namespace :populate do
  desc "Populate the database with the 3 basic maps"
  task :maps => :environment do
    [Map, Tile].each(&:delete_all)

    small_map = Factory.create :map
    9.times do |t|
      Factory.create(:tile, 
                     :map_id => small_map.id, 
                     :map_order => t + 1, 
                     :height => rand(4) + 1)
    end
    
    medium_map = Factory.create(:map, :name => "Medium", :height => 9, :width => 9)
    (medium_map.height * medium_map.width).times do |t|
      Factory.create(:tile,
                     :map_id => medium_map.id,
                     :map_order => t + 1,
                     :height => rand(4) + 1)
    end
    
  end
end