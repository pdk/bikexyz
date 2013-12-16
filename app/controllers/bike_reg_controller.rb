class BikeRegController < ApplicationController
  layout "simple"

  def new
    @bike_reg = BikeReg.new
  end

  def show
  end

  def edit
  end
end
