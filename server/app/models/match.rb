class Match < ActiveRecord::Base
  belongs_to :map
  has_many :GameUnits
  has_many :turns
  after_create :create_units
  
  private
  
  def create_units
    map.startunits.each do |su|
      GameUnit.create(:match_id => id, :unit_id => su.unit.id, :player => "human", :map_point_id => map.human_start_point.id)
      GameUnit.create(:match_id => id, :unit_id => su.unit.id, :player => "AI", :map_point_id => map.ai_start_point.id)
    end
  end
end