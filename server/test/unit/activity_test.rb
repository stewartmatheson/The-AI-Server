require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "only one activity is enabled at one time" do
    g = GameUnit.new
    a1 = Activity.new
    g.activities << a1
    g.save
    a1.save
    
    a2 = Activity.new
    g.activities << a2
    a2.save
    
    assert_equal 1, Activity.find(:all, :conditions => ["active = ? AND game_unit_id = ?", true, g.id]).count
  end
end