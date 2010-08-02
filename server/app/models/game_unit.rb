class GameUnit < ActiveRecord::Base
  belongs_to :unit
  has_one :location, :class_name => "map_point", :foreign_key => "map_point_id"
  has_many :activities
  belongs_to :match, :class_name => "Match", :foreign_key => "match_id"
  
  def has_activity?
    return false if Activity.find(:first, :conditions => ["game_unit_id = ? AND active = ?", id, true]) == nil
    true
  end
  
  def active_activity
    Activity.find(:first, :conditions => ["game_unit_id = ? AND active = ?", id, true])
  end
  
end