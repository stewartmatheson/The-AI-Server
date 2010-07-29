class Activity < ActiveRecord::Base
  belongs_to :game_unit, :class_name => "GameUnit", :foreign_key => "game_unit_id"
  belongs_to :rule, :class_name => "Rule", :foreign_key => "rule_id"
  belongs_to :destination, :class_name => "MapPoint", :foreign_key => "map_point_id"
  
  after_create :make_other_activities_disabled, :find_best_rule
  
  def execute
    #lets just create a random locaiton for now
    
    phase.increment
    save
  end
  
  private
  
  def make_other_activities_disabled
    Activity.find(:all, :conditions => ["game_unit_id = ? AND active = ? AND id != ?", game_unit.id, true, id]).each do |a|
      a.active = false
      a.save
    end
  end
  
  def find_best_rule
    rule = Rule.find(:first, :order_by => "order DESC")
    save
  end
  
end
