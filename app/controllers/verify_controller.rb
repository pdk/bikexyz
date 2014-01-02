class VerifyController < ApplicationController
  layout "boot_simple"
  
  def index
    id = params[:auth_id]
    key = params[:auth_key]
    
    @auth_key = AuthKey.where(:id => id, :key => key).first
    if @auth_key.present?
      # VERIFIED
      session[:email] = @auth_key.email
      redirect_to my_bike_regs_path
    end
    
    # fall thru and deliver the "you're not verified" page
  end
  
  def signout
    session[:email] = nil
  end
  
  def send_email
    @xyz_code = params[:xyz_code]
    @email = params[:email]

    @bike_reg = BikeReg.where(:xyz_code => @xyz_code).first
    if @bike_reg.blank?
      redirect_to root_path 
      return
    end
    
    if @email.present?
      if @bike_reg.authorized? @email
        
        if AuthKey.too_recent?(@email)
          flash.now[:alert] = "We very recently sent a verification email to that address. Please check your inbox and junk folder(s)."
          render :select_email_to_verify
          return
        end
        
        UserMailer.auth(@email).deliver
        render :send_email_sent
        return
      else
        flash.now[:alert] = "Sorry, that not right."
        render :select_email_to_verify
        return
      end
    else
      # no email given yet
      render :select_email_to_verify
      return
    end
  end
end
