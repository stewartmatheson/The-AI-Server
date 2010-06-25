class MapsController < ApplicationController
  respond_to :xml
  def index
    respond_with(@maps = Map.all)
  end
end
