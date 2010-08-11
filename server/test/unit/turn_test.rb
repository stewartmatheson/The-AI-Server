require 'test_helper'

class TurnTest < ActiveSupport::TestCase
  
  
  test "created activities have a game unit" do
    default
    medium_map = Map.find(:first, :conditions => 'name = "Medium"')
    m = Match.create(:map_id => medium_map.id)
    t = Turn.new
    t.match = m
    t.save
    assert_not_nil t.activities.first.game_unit
    assert_equal 18, t.activities.count
  end
  
  
  test "populate data works" do
    default
    assert_equal 3, Map.find(:all).count
  end
  
  
  test "turn has activities" do
    default
    medium_map = Map.find(:first, :conditions => 'name = "Medium"')
    m = Match.create(:map_id => medium_map.id)
    m.save
    assert_equal 18, m.GameUnits.count
    
    t = Turn.new
    t.match = m
    t.save
    assert_equal m, t.match
    assert_operator 0, :<, t.activities
  end
  
  
end