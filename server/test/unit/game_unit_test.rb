require 'test_helper'

class GameUnitTest < ActiveSupport::TestCase
  
  test "has_activity_returns false" do 
    g = GameUnit.new
    g.save
    assert_equal false, g.has_activity?
  end
  
  test "has_activity_returns_true" do
    g = GameUnit.new
    a = Activity.new
    g.activities << a
    g.save
    a.save
    assert_equal true, g.has_activity?
  end
  
  test "returns_active_activity" do
    g = GameUnit.new
    a = Activity.new
    g.activities << a
    g.save
    a.save
    assert_equal a, g.active_activity
  end
  
  test "active_activity_returns_nil_when_no_activity" do
    g = GameUnit.new
    g.save
    assert_equal nil, g.active_activity
  end
  
end
