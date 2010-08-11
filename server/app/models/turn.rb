class Turn < ActiveRecord::Base
  belongs_to :match
  has_many :activities, :class_name => "activity", :foreign_key => "turn_id"
  after_create :calculate_next_moves
  
  private 
  def calculate_next_moves
    match.GameUnits.each do |gu|
      gu.activities << Activity.create(:game_unit => gu, :turn_id => self.id) if !gu.has_activity?
      gu.active_activity.next_move
    end
  end
  
  
end
