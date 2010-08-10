class Turn < ActiveRecord::Base
  belongs_to :match
  after_create :calculate_next_moves
  
  
  private 
  def calculate_next_moves
    match.GameUnits.each do |gu|
      gu.activities << Activity.new(:game_unit_id => gu.id) if !gu.has_activity?
      gu.active_activity.next_move
    end
  end
  
  
end
