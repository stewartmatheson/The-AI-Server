namespace :populate do
  desc "Populate the database with the 3 basic maps"
  task :maps => :environment do
    [Map, Tile].each(&:delete_all)
    small_map = Factory.create :map
    9.times do |t|
      Factory.create(:tile, :map_id => small_map.id)
    end
  end
end