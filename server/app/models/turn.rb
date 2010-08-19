class Turn < ActiveRecord::Base
  belongs_to :match
  has_many :activities, :class_name => "Activity", :foreign_key => "turn_id"
  has_many :moves
  after_create :calculate_next_moves, :if => "is_human_move?"
  validates_presence_of :turn_counter, :on => :create, :message => "The turn counter must be set."
  validates_presence_of :match, :on => :create, :message => "Turn needs to belong to a match"
  
  private 
  def calculate_next_moves
    t = Turn.create(:turn_counter => turn_counter + 1)
    match.GameUnits.each do |gu|
      gu.activities << Activity.create(:game_unit => gu, :turn_id => t.id) if !gu.has_activity?
      gu.active_activity.next_move
    end
  end
  
  
  def is_human_move?
    !turn_counter.even?
  end
  
  
end
