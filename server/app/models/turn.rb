class Turn < ActiveRecord::Base
  belongs_to :match
  
  def after_create
    ai_turn
  end
  
  private
  
  def ai_turn
    
  end
  
end
