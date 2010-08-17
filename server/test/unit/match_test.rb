require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  
  def setup
    default
    @medium_map = Map.find(:first, :conditions => 'name = "Medium"')        
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
