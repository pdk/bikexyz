class VerifyController < ApplicationController
  layout "simple"
  
  def index
    id = params[:auth_id]
    key = params[:auth_key]
    
    @auth_key = AuthKey.where(:id => id, :key => key).first
    if @auth_key.present?
      # VERIFIED
      session[:email] = @auth_key.email
      redirect_to bike_regs_path
    end
    
    # fall thru and deliver the "you're not verified" page
  end
  
  def signout
    session[:email] = nil
  end
end
