require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  
  def setup
    i = Unit.find_by_name("Infantry");
    art = Unit.find_by_name("Artillery");
    arm = Unit.find_by_name("Armor");
    
    medium_map = Factory.create(:map, :name => "Medium", :height => 9, :width => 9)
    
    3.times do 
      Factory.create(:startunit, :map_id => medium_map.id, :unit_id => i.id)
    end
    
    3.times do 
      Factory.create(:startunit, :map_id => medium_map.id, :unit_id => art.id)
    end
    
    3.times do 
      Factory.create(:startunit, :map_id => medium_map.id, :unit_id => arm.id)
    end
    
    @current_match = Match.new
    @current_match.map = medium_map
    @current_match.save
  end
  
  test "only one activity is enabled at one time" do
    g = @current_match.GameUnits.first
    a1 = Activity.new
    g.activities << a1
    g.save
    a1.save
    
    a2 = Activity.new
    g.activities << a2
    a2.save
    
    assert_equal 1, Activity.find(:all, :conditions => ["active = ? AND game_unit_id = ?", true, g.id]).count
  end
  
  test "activity has a destination point" do
    a = Activity.new
    a.game_unit =  @current_match.GameUnits.first
    a.save    
    assert_not_nil a.destination
  end
  
  test "activity gets a destination point" do
    a = Activity.new
    a.game_unit =  @current_match.GameUnits.first
    a.save    
    assert_not_nil a.destination.xpos    
    assert_not_nil a.destination.ypos
  end
  
  test "activity gets a random x desitnation point" do
    assert_random :tolerance => 7 do
      a = Activity.new
      a.game_unit =  @current_match.GameUnits.first
      a.save
      a.destination.xpos
    end
  end
  
  test "activity gets a random y desitnation point" do
    assert_random :tolerance => 7 do
      a = Activity.new
      a.game_unit =  @current_match.GameUnits.first
      a.save
      a.destination.xpos
    end
  end
end