class Activity < ActiveRecord::Base
  belongs_to :game_unit, :class_name => "GameUnit", :foreign_key => "game_unit_id"
  belongs_to :rule, :class_name => "Rule", :foreign_key => "rule_id"
  belongs_to :destination, :class_name => "MapPoint", :foreign_key => "map_point_id"
  belongs_to :turn
  after_create :make_other_activities_disabled, :find_best_rule
  validates_presence_of :game_unit, :on => :create, :message => "An activity must have a game unit assigned to it"
  
  def next_move
    path = RaStar::Path.new(game_unit.match.map.ra_star_map, game_unit.location.ra_star_node, destination.ra_star_node)
    if(path.complete?)
      active = false
      save
    else
      Move.create(:game_unit => game_unit, :end_point => MapPoint.new(:xpos => path.next_step.x, :ypos => path.next_step.y), :start_point => game_unit.location)
    end
  end

  
  private
  def make_other_activities_disabled
    Activity.find(:all, :conditions => ["game_unit_id = ? AND active = ? AND id != ?", game_unit.id, true, id]).each do |a|
      a.active = false
      a.save
    end
  end
  
  
  def find_best_rule
    self.rule = Rule.find(:first, :order => "rule_order DESC")
    target_rally_point = game_unit.match.map.rally_points[rand(game_unit.match.map.rally_points.count)]
    self.destination = MapPoint.create(:xpos => rand(game_unit.match.map.height), :ypos => rand(game_unit.match.map.width))
    save
  end
  
  
end