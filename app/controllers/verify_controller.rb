class VerifyController < ApplicationController
  layout "simple"
  
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
    @which_email = params[:which_email].try(:to_sym)
    
    @bike_reg = BikeReg.where(:xyz_code => @xyz_code).first
    if not [:primary_email, :second_email, :third_email].include? @which_email
      @which_email = nil
    end

    @sent_email = nil
    
    if @bike_reg.blank?
      render :send_email_no_reg
      return
    elsif @which_email.present? and @bike_reg.read_attribute(@which_email).present?
      @sent_email = @bike_reg.read_attribute(@which_email)
    elsif @bike_reg.present? && @bike_reg.second_email.blank? and @bike_reg.third_email.blank?
      @sent_email = @bike_reg.primary_email
    end

    if @sent_email.present?
      UserMailer.auth(@sent_email).deliver
      render :send_email_sent
      return
    end
    
    render :select_email_to_verify
  end
end
