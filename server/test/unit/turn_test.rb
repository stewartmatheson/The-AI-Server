require 'test_helper'
class TurnTest < ActiveSupport::TestCase
  
  
  def setup
    default
    medium_map = Map.find(:first, :conditions => 'name = "Medium"')
    @m = Match.create(:map_id => medium_map.id)
    @t = Turn.new
    @t.match = @m
    @t.save
  end
  
  
  test "created activities have a game unit" do
    assert_not_nil @t.activities.first.game_unit
    assert_equal 18, @t.activities.count
  end

  
  test "turn has activities" do
    assert_equal 18, @m.GameUnits.count, ""
    assert_equal @m, @t.match
    assert_equal 18, @t.activities.count, "Turn has not created the correct amount of activities"
  end
  

#  test "turn creates AI respose" do
#    default
#  end
  
end