class ApplicationController < ActionController::Base
  protect_from_forgery

  if ENV['GLOBAL_APP_USERNAME'].present? and ENV['GLOBAL_APP_PASSWORD'].present?
    http_basic_authenticate_with :name => ENV['GLOBAL_APP_USERNAME'], :password => ENV['GLOBAL_APP_PASSWORD']
  end

  def user_for_paper_trail
    current_user
  end

  rescue_from CanCan::AccessDenied do |exception|
    # redirect_to root_url, :alert => exception.message
    flash.now[:alert] = exception.message
    render "pages/gologin"
  end

  def do_sharethis(doit = true)
    @include_sharethis = doit
  end
end
