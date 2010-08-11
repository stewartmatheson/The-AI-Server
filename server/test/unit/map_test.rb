require 'test_helper'

class MapTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "map points can get set correctly" do
    default
    medium_map = Map.find(:first, :conditions => 'name = "Medium"')
    assert medium_map.human_start_point
  end
end
