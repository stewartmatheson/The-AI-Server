class Match < ActiveRecord::Base
  belongs_to :map
  has_many :GameUnits
  after_create :create_units
  
  private
  
  def create_units
    map.startunits.each do |su|
      GameUnit.create(:match_id => id, :unit_id => su.unit.id, :player => "human")
      GameUnit.create(:match_id => id, :unit_id => su.unit.id, :player => "AI")
    end
  end
end
