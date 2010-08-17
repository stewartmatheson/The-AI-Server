require 'test_helper'

class MoveTest < ActiveSupport::TestCase


  def setup
    default
    medium_map = Map.find(:first, :conditions => 'name = "Medium"')
    m = Match.create(:map_id => medium_map.id)
    @t = Turn.new
    @t.match = m
    @t.save
  end


  test "Test if correct amount of moves get created" do
    assert_equal 18, Move.find(:all).count 
  end


end
