class MovesController < ApplicationController
  # GET /moves
  # GET /moves.xml
  def index
    @moves = Move.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @moves }
    end
  end

  # GET /moves/1
  # GET /moves/1.xml
  def show
    @move = Move.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @move }
    end
  end

  # GET /moves/new
  # GET /moves/new.xml
  def new
    @move = Move.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @move }
    end
  end

  # GET /moves/1/edit
  def edit
    @move = Move.find(params[:id])
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

  # PUT /moves/1
  # PUT /moves/1.xml
  def update
    @move = Move.find(params[:id])

    respond_to do |format|
      if @move.update_attributes(params[:move])
        format.html { redirect_to(@move, :notice => 'Move was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @move.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /moves/1
  # DELETE /moves/1.xml
  def destroy
    @move = Move.find(params[:id])
    @move.destroy

    respond_to do |format|
      format.html { redirect_to(moves_url) }
      format.xml  { head :ok }
    end
  end
end
