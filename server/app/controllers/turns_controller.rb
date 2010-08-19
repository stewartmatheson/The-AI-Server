class TurnsController < ApplicationController  
  skip_before_filter :verify_authenticity_token
  protect_from_forgery :except => [:create]

  # GET /turns/new
  # GET /turns/new.xml
  def new
    @turn = Turn.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @turn }
    end
  end


  def create
    @turn = Turn.new(params[:turn])

    respond_to do |format|
      if @turn.save

        i = 0
        while params["moves" + i.to_s] do
          startm = MapPoint.new
          startm.xpos = params["moves" + i.to_s]["start_xpos"]
          params["moves" + i.to_s].delete("start_xpos")
          startm.ypos = params["moves" + i.to_s]["start_ypos"]
          params["moves" + i.to_s].delete("start_ypos")
          startm.save     
          
          endm = MapPoint.new
          endm.xpos = params["moves" + i.to_s]["end_xpos"]
          params["moves" + i.to_s].delete("end_xpos")
          endm.ypos = params["moves" + i.to_s]["end_ypos"]
          params["moves" + i.to_s].delete("end_ypos")
          endm.save 
          
          @move = Move.new(params["moves" + i.to_s])
          @move.start_point = startm
          @move.end_point = endm
          @move.turn = @turn
          @move.save  
          i += 1
        end
        
        format.html { redirect_to(@turn, :notice => 'Turn was successfully created.') }
        format.xml  { render :action => "create", :status => :created, :location => @turn }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @turn.errors, :status => :unprocessable_entity }
      end
    end
  end

end
