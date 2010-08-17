class TurnsController < ApplicationController
  # GET /turns
  # GET /turns.xml
  
  skip_before_filter :verify_authenticity_token
  protect_from_forgery :except => [:create]
=begin
  def index
    @turns = Turn.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @turns }
    end
  end

  # GET /turns/1
  # GET /turns/1.xml
  def show
    @turn = Turn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @turn }
    end
  end
=end

  # GET /turns/new
  # GET /turns/new.xml
  def new
    @turn = Turn.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @turn }
    end
  end

=begin
  # GET /turns/1/edit
  def edit
    @turn = Turn.find(params[:id])
  end
=end

  # POST /turns
  # POST /turns.xml
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
        format.xml  { render :xml => @turn, :status => :created, :location => @turn }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @turn.errors, :status => :unprocessable_entity }
      end
    end
  end

=begin
  # PUT /turns/1
  # PUT /turns/1.xml
  def update
    @turn = Turn.find(params[:id])

    respond_to do |format|
      if @turn.update_attributes(params[:turn])
        format.html { redirect_to(@turn, :notice => 'Turn was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @turn.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /turns/1
  # DELETE /turns/1.xml
  def destroy
    @turn = Turn.find(params[:id])
    @turn.destroy

    respond_to do |format|
      format.html { redirect_to(turns_url) }
      format.xml  { head :ok }
    end
  end
=end

end
