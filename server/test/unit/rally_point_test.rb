require 'test_helper'

class RallyPointTest < ActiveSupport::TestCase


  def setup
    default
    @medium_map = Map.find(:first, :conditions => 'name = "Medium"')
  end


  test "Make sure maps have rally points" do
    assert_not_equal 0, @medium_map.rally_points.count
  end


end
