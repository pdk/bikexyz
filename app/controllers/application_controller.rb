class ApplicationController < ActionController::Base
  protect_from_forgery


  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to root_url, :alert => exception.message
    flash.now[:alert] = exception.message
    render "pages/gologin"
  end
end
