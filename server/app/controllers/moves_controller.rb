class MovesController < ApplicationController
  
  # GET /moves/new
  # GET /moves/new.xml
  def new
    @move = Move.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @move }
    end
  end

  # POST /moves
  # POST /moves.xml
  def create
    @move = Move.new(params[:move])

    respond_to do |format|
      if @move.save
        format.html { redirect_to(@move, :notice => 'Move was successfully created.') }
        format.xml  { render :xml => @move, :status => :created, :location => @move }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @move.errors, :status => :unprocessable_entity }
      end
    end
  end


end
