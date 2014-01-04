class BikeRegsController < ApplicationController
  layout "boot_simple"

  # GET /bike_regs
  # GET /bike_regs.json
  def index
    @bike_regs = BikeReg.order("created_at desc").limit(100)
    @user_bike_regs = nil
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bike_regs }
    end
  end
  
  def search
    @query = params[:query]
    
    if @query.present?
      @search_results = BikeReg.text_search(@query,25)
      if @search_results.blank?
        flash.now[:alert] = %{Nothing found for "#{@query}"}
      end
    end
  end
  
  def mine
    @user_email = session[:email]
    
    if @user_email.blank?
      redirect_to :bike_regs
    else
      @bike_regs = BikeReg.where("? in (primary_email, second_email, third_email)", @user_email)
      if @bike_regs.size == 1
        redirect_to bike_reg_path(@bike_regs[0].xyz_code)
        return
      end
    end
  end    

  def photo
    @xyz_code = LookupCode.disambiguate(params[:xyz_code])
    @photo_number = params[:photo_number].to_i

    @bike_reg = BikeReg.find_by_xyz_code(@xyz_code)
    
    @photo_url   = (@photo_number == 1) && (@bike_reg.photo_1_url(:medium))
    @photo_url ||= (@photo_number == 2) && (@bike_reg.photo_2_url(:medium))
    @photo_url ||= (@photo_number == 3) && (@bike_reg.photo_3_url(:medium))
    @photo_url ||= (@photo_number == 4) && (@bike_reg.photo_4_url(:medium))
    @photo_url ||= (@photo_number == 5) && (@bike_reg.photo_5_url(:medium))
    @photo_url ||= (@photo_number == 6) && (@bike_reg.photo_6_url(:medium))

    @next_page_url =   (@photo_number <= 1) && (@bike_reg.photo_2.present?) && bike_reg_photo_path(@xyz_code, 2)
    @next_page_url ||= (@photo_number <= 2) && (@bike_reg.photo_3.present?) && bike_reg_photo_path(@xyz_code, 3)
    @next_page_url ||= (@photo_number <= 3) && (@bike_reg.photo_4.present?) && bike_reg_photo_path(@xyz_code, 4)
    @next_page_url ||= (@photo_number <= 4) && (@bike_reg.photo_5.present?) && bike_reg_photo_path(@xyz_code, 5)
    @next_page_url ||= (@photo_number <= 5) && (@bike_reg.photo_6.present?) && bike_reg_photo_path(@xyz_code, 6)
    @next_page_url ||= (@photo_number <= 6) && bike_reg_path(@xyz_code)
    
  end

  def show
    do_sharethis
    @xyz_code = LookupCode.disambiguate(params[:xyz_code])
    if @xyz_code != params[:xyz_code]
      redirect_to bike_reg_path(@xyz_code)
      return
    end
    @bike_reg = BikeReg.find_by_xyz_code(@xyz_code)

    if @bike_reg.blank?
      render "not_found"
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @bike_reg }
      end
    end
  end
  
  # GET /bike_regs/new
  # GET /bike_regs/new.json
  def new
    @bike_reg = BikeReg.new

    # flash.now[:notice] = 'bonjour'
    # flash.now[:error] = 'dis b error'
    # flash.now[:alert] = 'beware!'
    # flash.now[:success] = 'awesome!'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bike_reg }
    end
  end

  # GET /bike_regs/1/edit
  def edit
    @bike_reg = BikeReg.find_by_xyz_code(params[:xyz_code])
    
    if not @bike_reg.authorized? session[:email]
      redirect_to send_verify_email_path(@bike_reg.xyz_code)
      return
    end
  end

  # POST /bike_regs
  # POST /bike_regs.json
  def create
    @bike_reg = BikeReg.new(params[:bike_reg])

    respond_to do |format|
      if @bike_reg.save
        format.html {
          flash[:success] = "Your bicycle was successfully registered."
          redirect_to bike_reg_path(@bike_reg.xyz_code)
        }
        format.json { render json: @bike_reg, status: :created, location: @bike_reg }
      else
        format.html {
          # flash.now[:error] = @bike_reg.errors.to_a
          flash.now[:error] = 'There were problems saving your registration. See below.'
          render action: "new"
        }
        format.json { render json: @bike_reg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bike_regs/1
  # PUT /bike_regs/1.json
  def update
    @bike_reg = BikeReg.find_by_xyz_code(params[:xyz_code])

    if not @bike_reg.authorized? session[:email]
      redirect_to send_verify_email_path(@bike_reg.xyz_code)
      return
    end

    respond_to do |format|
      if @bike_reg.update_attributes(params[:bike_reg])
        format.html {
          flash[:success] = "Your registration was successfully updated."
          redirect_to bike_reg_path(@bike_reg.xyz_code)
        }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bike_reg.errors, status: :unprocessable_entity }
      end
    end
  end
end
