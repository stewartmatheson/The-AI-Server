class Turn < ActiveRecord::Base
  belongs_to :match
  
  def after_create
    
  end
end
