class BikeRegsController < ApplicationController
  layout "simple"

  # GET /bike_regs
  # GET /bike_regs.json
  def index
    @bike_regs = BikeReg.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bike_regs }
    end
  end

  # GET /bike_regs/1
  # GET /bike_regs/1.json
  def show
    @bike_reg = BikeReg.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bike_reg }
    end
  end

  # GET /bike_regs/new
  # GET /bike_regs/new.json
  def new
    @bike_reg = BikeReg.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bike_reg }
    end
  end

  # GET /bike_regs/1/edit
  def edit
    @bike_reg = BikeReg.find(params[:id])
  end

  # POST /bike_regs
  # POST /bike_regs.json
  def create
    @bike_reg = BikeReg.new(params[:bike_reg])

    respond_to do |format|
      if @bike_reg.save
        format.html { redirect_to @bike_reg, notice: 'Bike reg was successfully created.' }
        format.json { render json: @bike_reg, status: :created, location: @bike_reg }
      else
        format.html { render action: "new" }
        format.json { render json: @bike_reg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bike_regs/1
  # PUT /bike_regs/1.json
  def update
    @bike_reg = BikeReg.find(params[:id])

    respond_to do |format|
      if @bike_reg.update_attributes(params[:bike_reg])
        format.html { redirect_to @bike_reg, notice: 'Bike reg was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bike_reg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bike_regs/1
  # DELETE /bike_regs/1.json
  def destroy
    @bike_reg = BikeReg.find(params[:id])
    @bike_reg.destroy

    respond_to do |format|
      format.html { redirect_to bike_regs_url }
      format.json { head :no_content }
    end
  end
end
