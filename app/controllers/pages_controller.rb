class PagesController < ApplicationController
  layout "boot_simple"
  
  def index
    do_sharethis
    @is_front_page = true
  end
end
