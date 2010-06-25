class UnitsController < ApplicationController
  respond_to :xml
  def index
    respond_with(@units = Unit.all)
  end
end
