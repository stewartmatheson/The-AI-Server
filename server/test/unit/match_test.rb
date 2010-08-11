require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  
  def setup
    i = Unit.find_by_name("Infantry");
    art = Unit.find_by_name("Artillery");
    arm = Unit.find_by_name("Armor");
    
    @medium_map = Factory.create(:map, :name => "Medium", :height => 9, :width => 9)
    
    3.times do 
      Factory.create(:startunit, :map_id => @medium_map.id, :unit_id => i.id)
    end
    
    3.times do 
      Factory.create(:startunit, :map_id => @medium_map.id, :unit_id => art.id)
    end
    
    3.times do 
      Factory.create(:startunit, :map_id => @medium_map.id, :unit_id => arm.id)
    end
    
    @m = Match.new
    @m.map = @medium_map
  end
  
  
  def teardown
    [Map, Tile, Startunit, RallyPoint, MapPoint].each(&:delete_all)
  end
  

  test "match gets created with the correct amount of game units" do
    @m.save
    assert_equal 18, @m.GameUnits.count
  end
  
  
  test "game units get created with map" do
    @m.save
    assert_equal @medium_map, @m.GameUnits.first.match.map
  end
  

end
